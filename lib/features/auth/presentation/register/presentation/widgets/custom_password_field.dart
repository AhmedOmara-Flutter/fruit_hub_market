import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final void Function()? onSuffixTap;
  final void Function(String)? onChange;


  const CustomPasswordField({
    this.obscureText = true,
    super.key,
    this.controller,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.onSuffixTap, this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor=AppColor.mainColor.withOpacity(0.1);
    return TextFormField(
      style: StyleManager.font14Weight600.copyWith(color: AppColor.mainColor),
      autovalidateMode: autoValidateMode,
      validator: validator,
      onChanged: onChange,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: "كلمة المرور",
        prefixIcon: Icon(Icons.password,color:AppColor.mainColor.withOpacity(0.5),),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: onSuffixTap),

        ),
        filled: true,
        fillColor: AppColor.mainColor.withOpacity(0.06),
        hintStyle: StyleManager.font14Weight600.copyWith(color: AppColor.mainColor),
        labelStyle: StyleManager.font14Weight600.copyWith(color: AppColor.mainColor),
        suffixIconColor: AppColor.mainColor.withOpacity(0.5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),

      ),
    );
  }
}
