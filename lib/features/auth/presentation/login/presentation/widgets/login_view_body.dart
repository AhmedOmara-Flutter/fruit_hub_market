import 'package:fruit_hub_market/core/utils/app_imports.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InfoActionRow(text: 'تسجيل دخول',isBack: true,bottomPadding: 0,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                LoginForm(),
                const SizedBox(height: 40),
                DontHaveAccountSection(),
                const SizedBox(height: 50),
                SocialLoginSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}