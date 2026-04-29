import 'package:fruit_hub_market/features/product_details/widgets/rating_and_reviews.dart';
import '../../../core/utils/app_imports.dart';
import '../../cart/presentation/widgets/quality_control.dart';
import '../../product/domain/entities/product_entity.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(text: TextSpan(
                        text: '68 جنيه / ', style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Color(0xffF4A91F)),
                        children: [
                          TextSpan(text: 'كيلو', style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Color(0xffF4A91F))),
      
                        ]
                    ))
                  ],
                ),
                QualityControl(buttonSize: 50,),
              ],
            ),
            const SizedBox(height: 10),
            RatingAndReviews(product: product,),
            const SizedBox(height: 15),
            Text(
              product.description,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Color(0xff979899)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
