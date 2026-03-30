import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_market/generated/assets.dart';

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
