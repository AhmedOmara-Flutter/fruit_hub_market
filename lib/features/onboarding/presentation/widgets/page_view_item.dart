import 'package:fruit_hub_market/core/utils/app_imports.dart';

class PageViewItem extends StatelessWidget {
  final PageViewModel pageViewModel;
  final int currentIndex;


  const PageViewItem({
    super.key, required this.pageViewModel, required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            OnBoardingBackground(background: pageViewModel.background,),
            OnBoardingSkipButton(),
            OnBoardingImage(image: pageViewModel.image,),
          ],
        ),
        SizedBox(height: 60),
        OnBoardingContent(pageViewModel: pageViewModel,),
        SizedBox(height: 50,),
        OnBoardingPageIndicator(currentIndex: currentIndex,),
      ],
    );
  }
}
