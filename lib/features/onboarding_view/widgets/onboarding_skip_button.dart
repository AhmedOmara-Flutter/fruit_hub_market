import 'package:flutter/material.dart';
import 'package:fruit_hub_market/core/utils/style_manager.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Text('تخط', style: StyleManager.font13Weight400,),
      ),
    );
  }
}
