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
        }
        if (state is GetSellingProductsErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }

        if (state is GetSellingProductsLoadingState) {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
        if (state is GetSellingProductsEmptyState) {
          return SliverToBoxAdapter(
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  'لا يوجد حاليا منتجات برجاء الاضافه', style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(
                ),
                  textAlign: TextAlign.center,
                )),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
