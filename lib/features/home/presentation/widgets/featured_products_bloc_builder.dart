import '../../../../core/utils/app_imports.dart';
import '../view_model/featured_cubit.dart';
import 'category_list.dart';

class FeaturedProductsBlocBuilder extends StatelessWidget {
  const FeaturedProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        var size = MediaQuery.of(context).size.width * 0.2;

        if (state is GetFeaturedProductsSuccessState) {
          return CategoryList(products: state.featuredProducts,);
        }
        else if (state is GetFeaturedProductsErrorState) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F5F7),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'dummy',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xff0C0D0D)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

              ],
            ),
          );
        }

      },
    );
  }
}
