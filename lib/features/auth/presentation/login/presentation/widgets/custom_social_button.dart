import '../../../../../../core/utils/app_imports.dart';

class CustomSocialButton extends StatelessWidget {
  final String image;
  final String text;

  const CustomSocialButton({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: OutlinedButton(
        onPressed: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(image, width: 20, height: 20),
            ),
            Text(text, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
