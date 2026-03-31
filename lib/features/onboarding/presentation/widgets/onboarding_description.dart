import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingDescription extends StatelessWidget {
  const OnBoardingDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا'
            ' الواسعة من الفواكه الطازجة الممتازة'
            ' واحصل على أفضل العروض والجودة العالية.',style: TextTheme.of(context).titleMedium!.copyWith(
      height: 1.7
    ),
     textAlign: TextAlign.center,

    );
  }
}
