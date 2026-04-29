import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

import '../../../core/helper_function/format_month.dart';
import '../../../core/utils/app_imports.dart';
import 'info_grid_card.dart';

class ProductInfoGridSection extends StatelessWidget {
  final ProductEntity product;

  const ProductInfoGridSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.8,

        children: [
          InfoGridCard(
            iconImage: Assets.images.calendar.path,
            title: formatMonths(product.expirationMonth.toInt()),
            sub: "الصلاحيه",
          ),
          if (product.isOrganic == true)
            InfoGridCard(
              iconImage: Assets.images.organic.path,
              title: "100%",
              sub: "اوجانيك",
            ),
          InfoGridCard(
            iconImage: Assets.images.calories.path,
            title: "${product.numberOfCalories} كالوري",
            sub: "${product.unitAmount} جرام",
          ),
          InfoGridCard(
            iconImage: Assets.images.rating.path,
            title: "${product.avgRating} (${product.ratingCount})",
            sub: "التقييمات",
          ),
        ],
      ),
    );
  }
}
