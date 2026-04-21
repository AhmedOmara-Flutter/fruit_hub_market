import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/core/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        if (state is GetProductsSuccessState) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            sliver: SliverGrid.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return FruitItem(product: state.products[index]);
              },
            ),
          );
        } else if (state is GetProductsErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage),
            ),);
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
