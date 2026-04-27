import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/core/widgets/fruit_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../core/helper_function/get_dummy_products.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FruitItem(product:products[index]);
        },
      ),
    );
  }
}
