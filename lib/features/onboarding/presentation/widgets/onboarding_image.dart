import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingImage extends StatelessWidget {
  final String image;
  const OnBoardingImage({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: SvgPicture.asset(image)
    );
  }
}
