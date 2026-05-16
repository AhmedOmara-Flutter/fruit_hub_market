import '../../../../core/utils/app_imports.dart';
import '../../../product/domain/entities/product_entity.dart';

class ProductSubImagesSection extends StatelessWidget {
  final ProductEntity product;
  const ProductSubImagesSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final images = product.subImages ?? [];
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(images.length, (index) =>
            Container(
              margin: EdgeInsets.only(top: 15, right: 10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(images[index]), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),),),),
        ),
      ),
    );
  }
}
