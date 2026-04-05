import '../../../../../../core/utils/app_imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;


  const CustomTextFormField({super.key, this.controller, this.keyboardType, this.hintText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller:controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText:hintText),
    );
  }
}
