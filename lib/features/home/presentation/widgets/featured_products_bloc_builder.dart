import 'package:fruit_hub_market/features/home/presentation/widgets/skeletonizer_category_item.dart';
import '../../../../core/utils/app_imports.dart';
import '../view_model/featured_cubit.dart';
import 'category_item.dart';

class FeaturedProductsBlocBuilder extends StatelessWidget {
  const FeaturedProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is GetFeaturedProductsSuccessState) {
          if (state.featuredProducts.isEmpty) {
            return SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
                child: Container(
                  width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10,top: 10),
                    child: Text(
                      'لا يوجد حاليا منتجات مميزه برجاء الاضافه', style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge!.copyWith(
                    ),
                      textAlign: TextAlign.center,
                    )));
          }
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.15,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CategoryItem(productEntity: state.featuredProducts[index]),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: state.featuredProducts.length,
            ),
          );
        }
        else if (state is GetFeaturedProductsErrorState) {
          return Center(child: Text(state.errMessage));
        }
        else {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.15,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SkeletonizerCategoryItem(),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: 5,
            ),
          );
        }
      },
    );
  }
}
