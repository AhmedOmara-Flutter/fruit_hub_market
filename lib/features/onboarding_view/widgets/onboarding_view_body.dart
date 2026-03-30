import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_market/core/utils/style_manager.dart';

import '../../../generated/assets.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(Assets.images.onboardingBackground2.path,fit: BoxFit.fill,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text('تخط', style: StyleManager.font13Weight400,),
            ),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(Assets.images.onboardingLogo2.path)
            ),
          ],
        ),
        SizedBox(height: 45,),
        RichText(
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

        ),
        Text(
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'
        ),
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Color(0xff1B5E37),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Color(0xff5DB957),
                shape: BoxShape.circle,
              ),
            ),
          ],
        )
      ],
    );
  }
}
