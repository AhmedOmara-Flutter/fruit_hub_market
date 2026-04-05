import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;

  const CustomPasswordField({
    this.obscureText = true,
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: "كلمة المرور",
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
        ),
      ),
    );
  }
}
