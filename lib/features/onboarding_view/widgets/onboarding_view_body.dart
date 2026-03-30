import 'package:flutter/material.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_background.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_content.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_image.dart';
import 'package:fruit_hub_market/features/onboarding_view/widgets/onboarding_skip_button.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            OnBoardingBackground(),
            OnBoardingSkipButton(),
            OnBoardingImage(),
          ],
        ),
        SizedBox(height: 60),
        OnBoardingContent(),
      ],
    );
  }
}
