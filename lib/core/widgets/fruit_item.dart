import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../../features/cart/presentation/view_model/cart_cubit.dart';
import '../../features/favorite/presentation/view_model/favorite_cubit.dart';
import '../../features/offers/presentation/view_model/offer_cubit.dart';
import '../cubit/product_cubit/product_cubit.dart';
import '../entities/product_entity.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity product;
  const FruitItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final offer = context
        .watch<OfferCubit>()
        .offersMap[product.id];
final hasOffer = offer != null && offer.isActive;
    return GestureDetector(
      onTap: () async {
        await AppSounds.playClickSound('click_song.wav');
        Navigator.pushNamed(
          context,
          RouteManager.productDetails,
          arguments: product,
        );
        context.read<ProductCubit>().increaseSellingCount(product.id);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final cubit = context.watch<FavoriteCubit>();
                final isFavorite = cubit.favorites[product.id] ?? false;

                return Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(product);
                    },
                    icon: isFavorite
                        ? const Icon(
                      Icons.favorite,
                      color: Color(0xffEB5757),
                    )
                        : const Icon(Icons.favorite_border),
                  ),
                );
              },
            ),

            if (hasOffer)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    '%${offer.discountPercentage.toInt()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            Positioned.fill(
              top: 25,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Flexible(
                    child: CachedNetworkImage(
                      imageUrl: product.image ?? '',
                      placeholder: (context, url) =>
                      const Center(
                        child: Skeletonizer(
                          child: SizedBox(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Center(
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),

                  ListTile(
                    dense: true,
                    title: Text(
                      product.name,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    subtitle: hasOffer
                        ? Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${offer.priceBeforeDiscount} جنيه',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                            color: Colors.grey,
                            decoration:
                            TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          '${offer.priceAfterDiscount} جنيه / كيلو',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                        : Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${product.price} جنية / ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                              color: const Color(0xffF4A91F),
                            ),
                          ),
                          TextSpan(
                            text: 'كيلو',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                              color: const Color(0xffF4A91F),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),

                    trailing: GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().addProduct(product,offer);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.mainColor,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
