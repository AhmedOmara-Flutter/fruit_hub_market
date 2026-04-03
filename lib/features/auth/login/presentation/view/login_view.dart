import 'package:fruit_hub_market/core/utils/app_imports.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("تسجيل دخول",),
        centerTitle: true,
      ),
      body: LoginViewBody(),
    );
  }

}