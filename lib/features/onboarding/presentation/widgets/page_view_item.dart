import 'package:fruit_hub_market/core/utils/app_imports.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
  });

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
