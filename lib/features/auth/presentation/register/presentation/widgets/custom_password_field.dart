import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final void Function()? onSuffixTap;

  const CustomPasswordField({
    this.obscureText = true,
    super.key,
    this.controller,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode,
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: "كلمة المرور",
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: onSuffixTap),
        ),
      ),
    );
  }
}
