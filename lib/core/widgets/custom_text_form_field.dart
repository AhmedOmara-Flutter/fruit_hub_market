import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final void Function()? onSuffixPressed;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? label;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.autoValidateMode,
    this.onSaved,
    this.onSuffixPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.label, this.readOnly=false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor=AppColor.mainColor.withOpacity(0.1);
    return Column(
      children: [
        if (label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  label!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 8),
              CircleAvatar(backgroundColor: Colors.red, radius: 2),
            ],
          ),
        if (label != null) SizedBox(height: 8),
        TextFormField(
          style: StyleManager.font14Weight600.copyWith(color: AppColor.mainColor),
          readOnly: readOnly,
          onSaved: onSaved,
          autovalidateMode: autoValidateMode,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon, color: AppColor.mainColor.withOpacity(0.5)),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: onSuffixPressed,
                icon: Icon(suffixIcon),
              ),
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
        ),
      ],
    );
  }
}
