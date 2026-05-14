import '../../../../core/utils/app_imports.dart';

class CartInfoBanner extends StatelessWidget {
  final int productsInCart;
  const CartInfoBanner({super.key, required this.productsInCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(vertical: 12),
      color: AppColor.mainColor.withOpacity(0.1),
      child: Text(
        'لديك $productsInCart منتجات في سلة التسوق',
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColor.mainColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
