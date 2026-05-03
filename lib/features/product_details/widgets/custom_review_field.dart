import '../../../../core/utils/app_imports.dart';

class CustomReviewField extends StatelessWidget {
  const CustomReviewField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
