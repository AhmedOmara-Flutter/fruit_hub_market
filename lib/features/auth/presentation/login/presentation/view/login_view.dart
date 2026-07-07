import 'package:flutter/services.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(instance()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              AppVibration.medium();
              AppSounds.playClickSound('success.mp3');

              customShowSnakeBar(
                  context, color: AppColor.mainColor,
                  label: 'تم التسجيل الدخول بنجاح');
              CacheHelper.saveData(key: 'uId', value: state.user.uId).then((value){
                Constants.uId=state.user.uId;
              });
              Navigator.pushNamed(context, RouteManager.home,arguments: state.user);
            }
            if (state is LoginError) {
              AppVibration.heavy();
              AppSounds.playClickSound('click_error.wav');

              customShowSnakeBar(
                  context, color: AppColor.red, label: state.errMessage);
            }
          },
          builder: (context, state) {
            return AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.light,child: PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (didPop) return;
                  SystemNavigator.pop();
                },
                child: Container(
                  height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.images.splashBg.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                child: LoginViewBody())));
          },
        ),
      ),
    );
  }

}