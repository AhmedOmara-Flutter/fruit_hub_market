import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../../product/domain/entities/product_entity.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery
            .sizeOf(context)
            .height * 0.45,
        child: Stack(
          children: [
            SvgPicture.asset(
              Assets.images.productDetailsBg.path,
              width: double.infinity,
              fit: BoxFit.fill,),
            Center(
              child: Image.network(product.image!, height: 220,
              ),
            ),
            Positioned(
              top: 40,
              right: 10,
              child: CustomBackButton(color: Colors.white,),

            ),
          ],
        ),
      ),
    );
  }
}
