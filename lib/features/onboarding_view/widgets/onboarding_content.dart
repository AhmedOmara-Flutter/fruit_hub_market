import 'package:flutter/material.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_description.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_page_indicator.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_title.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnBoardingTitle(),
        OnBoardingDescription(),
        OnBoardingPageIndicator(),
      ],
    );
  }
}
