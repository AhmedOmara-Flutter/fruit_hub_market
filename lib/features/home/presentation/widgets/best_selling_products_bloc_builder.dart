import '../../../../core/utils/app_imports.dart';
import '../../../../core/widgets/products_grid_view.dart';
import '../view_model/best_selling_cubit.dart';

class BestSellingProductsBlocBuilder extends StatelessWidget {
  const BestSellingProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellingCubit, BestSellingState>(
      builder: (context, state) {
        if (state is GetSellingProductsSuccessState) {
          return ProductsGridView(products: state.sellingProducts);
        } else if (state is GetSellingProductsErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
