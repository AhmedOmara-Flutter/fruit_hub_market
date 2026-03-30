import 'package:flutter/material.dart';
import 'package:fruit_hub_market/core/utils/style_manager.dart';

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'مرحبًا بك في ',
          style: StyleManager.font23Weight700,
          children: [
            TextSpan(
                text: 'Fruit',
                style: StyleManager.font23Weight700.copyWith(
                    color: Color(0xff1B5E37)
                )
            ),
            TextSpan(
                text: 'Hub',
                style: StyleManager.font23Weight700.copyWith(
                    color: Color(0xffF4A91F)
                )

            ),
          ]
      ),

    );
  }
}
