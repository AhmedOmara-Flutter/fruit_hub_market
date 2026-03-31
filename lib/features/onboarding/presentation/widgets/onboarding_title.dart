import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingTitle extends StatelessWidget {
  final String title;
  const OnBoardingTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
          style: TextTheme.of(context).titleLarge,
        // children: [
        //   TextSpan(
        //       text: 'Fruit',
        //       style: TextTheme.of(context).titleLarge!.copyWith(
        //         color: Color(0xff1B5E37)
        //       )
        //   ),
        //   TextSpan(
        //       text: 'Hub',
        //       style: TextTheme.of(context).titleLarge!.copyWith(
        //         color: Color(0xffF4A91F)
        //       )
        //
        //   ),
        // ]
      ),

    );
  }
}
