import 'package:carousel_slider/carousel_slider.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/featured_item.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/skeletonizer_featured_item.dart';
import 'package:fruit_hub_market/features/offers/presentation/view_model/offer_cubit.dart';

import '../../../../../../../core/utils/app_imports.dart';

class FeaturedList extends StatefulWidget {
  const FeaturedList({super.key});

  @override
  State<FeaturedList> createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        final offers = context.read<OfferCubit>().offers;

        if (state is GetOffersLoading) {
          return Column(
            children: [
              SizedBox(height: 15),
              CarouselSlider.builder(
                itemCount: offers.length,
                itemBuilder: (context, index, realIndex) {
                  return SkeletonizerFeaturedItem();
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.21,
                  viewportFraction: 0.95,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() => currentIndex = index);
                  },
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Skeletonizer(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width:8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
            ],
          );
        }
        if (state is GetOffersSuccess) {
          return Column(
            children: [
              SizedBox(height: 15),
              CarouselSlider.builder(
                itemCount: offers.length,
                itemBuilder: (context, index, realIndex) {
                  return FeaturedItem(offer: offers[index]);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.21,
                  viewportFraction: 0.95,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() => currentIndex = index);
                  },
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                ),
              ),
              const SizedBox(height: 15),
             // if(offers.length>2)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(offers.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 14 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? AppColor.mainColor: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
            ],
          );
        }
        if (state is GetOffersFailure) {
          return Center(child: Text(state.errMessage));
        }
        return SizedBox.shrink();

      },
    );
  }
}