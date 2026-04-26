import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../core/helper_function/get_dummy_products.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        if (state is GetSellingProductsSuccessState) {
          return ProductsGridView(sellingProducts: state.sellingProducts);
        } else if (state is GetSellingProductsErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(sellingProducts: getDummyProducts()),
          );
        }
      },
    );
  }
}
