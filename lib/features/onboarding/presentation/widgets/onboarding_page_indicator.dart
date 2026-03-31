import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  final bool isActive;
  const OnBoardingPageIndicator({
    super.key, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, children: [
      InActiveDot(),
      SizedBox(width: 10,),
      ActiveDot(),

    ],
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: Color(0xff1B5E37),
        shape: BoxShape.circle,
      ),
    );
  }
}

class InActiveDot extends StatelessWidget {
  const InActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Color(0xff5DB957),
        shape: BoxShape.circle,
      ),
    );
  }
}
