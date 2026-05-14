import '../../../../core/utils/app_imports.dart';

class ProductEmptyWidget  extends StatelessWidget {
  const ProductEmptyWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.emptyCart.path),
            Text('المنتجات غير متوفرة حالياً', style: Theme
                .of(context)
                .textTheme
                .titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
