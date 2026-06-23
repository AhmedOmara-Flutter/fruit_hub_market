import 'package:carousel_slider/carousel_slider.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/offer_carousel_item.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/skeletonizer_featured_item.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../offers/presentation/view_model/offer_cubit.dart';

class OfferCarouselList extends StatefulWidget {
  const OfferCarouselList({super.key});

  @override
  State<OfferCarouselList> createState() => _OfferCarouselListState();
}

class _OfferCarouselListState extends State<OfferCarouselList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {

        if (state is GetOffersLoading) {
          return _buildLoading();
        }

        if (state is GetOffersFailure) {
          return Center(child: Text(state.errMessage));
        }

        if (state is GetOffersSuccess) {
          final offers = state.offers.where((e) => e.isActive).toList();

          if (offers.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            children: [
              const SizedBox(height: 15),

              CarouselSlider.builder(
                itemCount: offers.length,
                itemBuilder: (context, index, realIndex) {
                  return OfferCarouselItem(offer: offers[index]);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.21,
                  viewportFraction: 0.95,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() => currentIndex = index);
                  },
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(offers.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 14 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColor.mainColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 10),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoading() {
    return Column(
      children: [
        const SizedBox(height: 15),
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return SkeletonizerFeaturedItem();
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.21,
            viewportFraction: 0.95,
            autoPlay: true,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}