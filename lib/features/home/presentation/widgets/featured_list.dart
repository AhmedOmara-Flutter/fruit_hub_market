// import 'package:fruit_hub_market/features/home/presentation/widgets/featured_item.dart';
// import '../../../../../../../core/utils/app_imports.dart';
//
//
// class FeaturedList extends StatelessWidget {
//   const FeaturedList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(4, (index) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: FeaturedItem(),
//         ),),
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/featured_item.dart';

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
    return Column(
      children: [
        SizedBox(height: 15),
        CarouselSlider.builder(
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return FeaturedItem();
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
}