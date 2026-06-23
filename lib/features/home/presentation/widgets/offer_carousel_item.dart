import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/offer_carousel_item_button.dart';

import '../../../../core/entities/offer_entity.dart';

class OfferCarouselItem extends StatelessWidget {
  final OfferEntity offer;
  const OfferCarouselItem({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery
        .sizeOf(context)
        .width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade100
          )
        ),
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: Image.network(
                  offer.image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.images.bannerBackground.path),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 33,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'عروض اليوم',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        'خصم ${offer.discountPercentage}%',
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontSize: 19),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      OfferCarouselItemButton(
                        onPressed: () {
                          Navigator.pushNamed(context,
                            RouteManager.productDetails,
                            arguments:offer.productId,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}