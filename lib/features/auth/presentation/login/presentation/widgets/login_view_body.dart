import 'package:fruit_hub_market/features/auth/presentation/login/presentation/widgets/dont_have_account_section.dart';
import 'package:fruit_hub_market/features/auth/presentation/login/presentation/widgets/login_form.dart';
import 'package:fruit_hub_market/features/auth/presentation/login/presentation/widgets/social_login_section.dart';

import '../../../../../../core/utils/app_imports.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            LoginForm(),
            const SizedBox(height: 40),
            DontHaveAccountSection(),
            const SizedBox(height: 50),
            SocialLoginSection()
          ],
        ),
      ),
    );
  }
}