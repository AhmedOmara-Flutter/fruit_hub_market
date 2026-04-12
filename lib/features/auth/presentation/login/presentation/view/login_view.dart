import 'package:fruit_hub_market/core/utils/app_imports.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("تسجيل دخول",),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(instance()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              customShowSnakeBar(
                  context, color: Colors.green,
                  label: 'تم التسجيل الدخول بنجاح');
              CacheHelper.saveData(key: 'uId', value: state.user.uId).then((value){
                Constants.uId=state.user.uId;
              });
              Navigator.pushNamed(context, RouteManager.home,arguments: state.user);
            }
            if (state is LoginError) {
              customShowSnakeBar(
                  context, color: Colors.red, label: state.errMessage);
            }
          },
          builder: (context, state) {
            return LoginViewBody();
          },
        ),
      ),
    );
  }

}