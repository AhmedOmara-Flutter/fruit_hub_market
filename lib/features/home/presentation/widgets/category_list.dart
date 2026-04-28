import 'package:fruit_hub_market/features/home/presentation/widgets/category_item.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../product/domain/entities/product_entity.dart';

class CategoryList extends StatelessWidget {
  final List<ProductEntity> products ;
  const CategoryList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryItem(productEntity: products[index],),
        separatorBuilder: (context, index) => SizedBox(width: 10,),
        itemCount: products.length,
      ),
    );
  }
}
