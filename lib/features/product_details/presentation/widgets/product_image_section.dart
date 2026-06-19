
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/discount_bedge.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/entities/offer_entity.dart';
import '../../../../core/entities/product_entity.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({
    super.key,
    required this.product,
    required this.offer,

  });

  final ProductEntity product;
  final OfferEntity? offer;


  @override
  Widget build(BuildContext context) {
    final localOffer = offer;
    final hasOffer = localOffer?.isActive ?? false;
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
              child: CachedNetworkImage(
                height: 220,
                imageUrl: product.image??'',
                placeholder: (context, url) =>
                    const Center(child: Skeletonizer(child: SizedBox(height: 220,),)),
                errorWidget: (context, url, error) =>
                    Center(child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                        color: Colors.grey.shade300,),
                    )),
              )
            ),
            Positioned(
              top: 40,
              right: 10,
              child: CustomBackButton(color: Colors.white,),
            ),
            if (hasOffer)
              Positioned(
                top:MediaQuery.of(context).size.height*0.05,
                left: -8,
                child: DiscountBadge(percent: localOffer!.discountPercentage,
                ),
              ),
          ],
        ),
      ),
    );
  }

}

