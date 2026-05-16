import 'package:fruit_hub_market/core/utils/app_imports.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("حساب جديد"), centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(instance()),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if(state is RegisterLoading){
                CircularProgressIndicator();
              }
              if (state is RegisterSuccess) {
                AppVibration.medium();
                AppSounds.playClickSound('success.mp3');
                customShowSnakeBar(
                    context, color:AppColor.mainColor, label: 'تم انشاء الحساب بنجاح');
                Navigator.pushNamed(context, RouteManager.login);
              }
              if (state is RegisterError) {
                AppVibration.heavy();
                AppSounds.playClickSound('click_error.wav');

                customShowSnakeBar(
                    context, color: AppColor.red, label: state.errMessage);
              }
            },
            builder: (context, state) {
              return RegisterViewBody();
            },
          ),
        )
    );
  }
}
