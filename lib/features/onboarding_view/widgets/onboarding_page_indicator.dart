import 'package:flutter/material.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
