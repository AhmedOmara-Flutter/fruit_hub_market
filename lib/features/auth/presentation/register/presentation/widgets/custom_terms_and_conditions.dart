import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomTermsAndConditions extends StatelessWidget {
  const CustomTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffDDDFDF)),
          ),
        ),
        RichText(
          text: TextSpan(
            text: ' من خلال إنشاء حساب ، فإنك توافق على',
            style: Theme.of(context).textTheme.titleMedium,
            children: [
              TextSpan(
                text: ' الشروط \nوالأحكام الخاصة بنا',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Color(0xff2D9F5D)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
