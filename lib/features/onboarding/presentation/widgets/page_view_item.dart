import 'package:fruit_hub_market/core/utils/app_imports.dart';

class PageViewItem extends StatelessWidget {
  final PageViewModel pageViewModel;


  const PageViewItem({
    super.key, required this.pageViewModel,
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
        SizedBox(height: 50),
        OnBoardingContent(pageViewModel: pageViewModel,),
      ],
    );
  }
}
