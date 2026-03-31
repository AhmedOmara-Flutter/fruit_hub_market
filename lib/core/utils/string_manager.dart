import 'package:fruit_hub_market/core/utils/app_imports.dart';

class StringManager {

  static Widget onBoardingTitle1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('مرحبًا بك في ', style: Theme
            .of(context)
            .textTheme
            .titleLarge,),
        Text('Hub', style: Theme
            .of(context)
            .textTheme
            .titleLarge!
            .copyWith(
            color: Color(0xffF4A91F)
        )
        ),
        Text('Fruit', style: Theme
            .of(context)
            .textTheme
            .titleLarge!
            .copyWith(
            color: Color(0xff1B5E37)
        )),
      ],
    );
  }

  static Widget onBoardingTitle2(BuildContext context) {
    return Text('ابحث وتسوق', style: Theme
        .of(context)
        .textTheme
        .titleLarge);
  }


  static const onBoardingDescription1 =
      'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف\nمجموعتنا'
      'الواسعة من الفواكه الطازجة الممتازة\n'
      'واحصل على أفضل العروض والجودة العالية.';
  static const onBoardingDescription2 =
      'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على\nالتفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة\nالمثالية';
}
