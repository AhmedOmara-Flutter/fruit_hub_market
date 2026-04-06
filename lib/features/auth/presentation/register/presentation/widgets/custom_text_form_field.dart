import '../../../../../../core/utils/app_imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String?)?validator;
  final AutovalidateMode? autoValidateMode;


  const CustomTextFormField(
      {super.key, this.controller, this.keyboardType, this.hintText, this.validator, this.autoValidateMode = AutovalidateMode
          .onUserInteraction});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      autovalidateMode:autoValidateMode,
      validator: validator,
      controller:controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText:hintText),
    );
  }
}
