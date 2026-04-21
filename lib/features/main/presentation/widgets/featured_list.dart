import '../../../../core/utils/app_imports.dart';


class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical:20 ),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FeaturedItem(),
        ),),
      ),
    );
  }
}
