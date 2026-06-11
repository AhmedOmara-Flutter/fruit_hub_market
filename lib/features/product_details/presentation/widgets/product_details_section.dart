
import 'package:fruit_hub_market/features/product_details/presentation/widgets/rating_and_reviews.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../offers/domain/entities/offer_entity.dart';
import '../../../product/domain/entities/product_entity.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
    required this.product,
    required this.offer,
  });
  final ProductEntity product;
  final OfferEntity? offer;


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
                        text: '${product.price} جنيه / ', style: Theme
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
                buildSimplePrice(
                    context: context, offer: offer, product: product),

                // QualityControl(buttonSize: 50, cartItemEntity: CartItemEntity(product: product, quantity: 1)),
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

  Widget buildSimplePrice({
    required BuildContext context,
    required OfferEntity? offer,
    required ProductEntity product,
  }) {
    final hasOffer = offer != null && offer.isActive;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // السعر
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hasOffer)
                Text(
                  '${offer.priceBeforeDiscount} جنيه',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),

              Text(
                hasOffer
                    ? '${offer.priceAfterDiscount} جنيه'
                    : '${product.price} جنيه',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Color(0xffF4A91F)),
              ),

              if (hasOffer)
                Text(
                  offer.remainingDays > 0
                      ? 'باقي ${offer.remainingDays} أيام'
                      : 'ينتهي اليوم',
                  style:StyleManager.font11Weight400.copyWith(                    color: Colors.red.shade400,
                  )),
            ],
          ),
          SizedBox(width: 15,),
          if (hasOffer)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child:  Text(
                '-${offer.discountPercentage.toInt()}%',
                style:Theme
                    .of(context)
                    .textTheme
                    .labelLarge!.copyWith(color: Colors.white),
              ),
            ),

        ],
      ),
    );
  }
}
