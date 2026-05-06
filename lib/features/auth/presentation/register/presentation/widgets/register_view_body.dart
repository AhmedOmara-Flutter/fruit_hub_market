import 'package:fruit_hub_market/core/utils/app_imports.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RegisterForm(),
            const SizedBox(height: 40),
            const CustomAuthFooter(),
          ],
        ),
      ),
    );
  }
}
