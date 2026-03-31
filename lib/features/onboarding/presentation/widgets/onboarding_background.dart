import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingBackground extends StatelessWidget {
  const OnBoardingBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(Assets.images.onboardingBackground1.path,fit: BoxFit.fill,),
      ],
    );
  }
}
