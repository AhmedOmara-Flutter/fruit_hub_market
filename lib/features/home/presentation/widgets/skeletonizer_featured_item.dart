import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/offer_carousel_item_button.dart';

import '../../../../core/entities/offer_entity.dart';

class SkeletonizerFeaturedItem extends StatelessWidget {
  const SkeletonizerFeaturedItem({super.key,});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery
        .sizeOf(context)
        .width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,

            border: Border.all(
                color: Colors.grey.shade100
            )
        ),
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Container(
                  child: Image.asset(Assets.images.appIcon.path),
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
                  child: Skeletonizer(
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
                          'خصم 25%',
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
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                      ],
                    ),
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