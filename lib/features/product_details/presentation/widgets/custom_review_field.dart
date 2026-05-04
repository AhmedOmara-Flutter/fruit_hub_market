import '../../../../core/utils/app_imports.dart';

class CustomReviewField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onPressed;
  const CustomReviewField({super.key, required this.controller, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(

        hintText: 'اكتب التعليق..',
        prefixIcon: Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red
          ),
          child: SvgPicture.asset(Assets.images.reviewImage.path),
        ),
        suffixIcon: IconButton(onPressed:onPressed,
            icon: Icon(Icons.send_rounded)),
        hintStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: Color(0xff111719)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
      ),
    );
  }
}
