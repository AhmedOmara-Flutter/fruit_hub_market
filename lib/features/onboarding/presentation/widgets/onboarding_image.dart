import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: SvgPicture.asset(Assets.images.onboardingLogo1.path)
    );
  }
}
