import '../../../../core/utils/app_imports.dart';

class CartInfoBanner extends StatelessWidget {
  const CartInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(vertical: 12),
      color: Color(0xffEBF9F1),
      child: Text(
        'لديك 3 منتجات في سلة التسوق',
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: Color(0xff1B5E37)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
