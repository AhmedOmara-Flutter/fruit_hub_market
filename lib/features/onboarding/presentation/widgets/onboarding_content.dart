import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          OnBoardingTitle(),
          SizedBox(height: 30,),
          OnBoardingDescription(),
          SizedBox(height: 50,),
          OnBoardingPageIndicator(isActive: true,),
        ],
      ),
    );
  }
}
