import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String?)?onSaved ;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final void Function()? onSuffixPressed;
  final IconData ?suffixIcon;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction, this.onSaved,
    this.onSuffixPressed, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      autovalidateMode: autoValidateMode,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hintText,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(onPressed: onSuffixPressed, icon: Icon(suffixIcon)),
          )),

    );
  }
}
