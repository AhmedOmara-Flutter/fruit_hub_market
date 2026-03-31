import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final int currentIndex = 0;
  final List<PageViewModel> items = [];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => PageViewItem(),
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      onPageChanged: (index) {},
      itemCount: 2,
    );
  }
}
