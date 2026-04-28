import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

import '../../../../core/utils/app_imports.dart';

class CategoryItem extends StatelessWidget {
  final ProductEntity productEntity;
  const CategoryItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.2;
    return Column(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: Color(0xffF3F5F7),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.network(
              productEntity.image ?? '',
              height: size * 0.75,
              width: size * 0.75,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          productEntity.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xff0C0D0D)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
