import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

import '../../../../core/utils/app_imports.dart';

class CategoryItem extends StatelessWidget {
  final ProductEntity productEntity;
  const CategoryItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Color(0xffF3F5F7),
        shape: BoxShape.circle,
      ),
      child:Center(
        child: Image.network(
          productEntity.image??'',
          height: 65,
          width: 65,
          fit: BoxFit.contain,
        ),
      ) ,
    );
  }
}
