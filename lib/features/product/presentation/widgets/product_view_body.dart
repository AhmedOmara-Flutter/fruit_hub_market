import 'package:fruit_hub_market/features/product/presentation/widgets/items_count_label.dart';

import '../../../../../../../core/utils/app_imports.dart';
import '../../../../core/widgets/products_grid_view.dart';
import '../../../../core/widgets/search_section.dart';
import '../view_model/product_cubit.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductCubit>(context).getProducts();
    });
    super.initState();
  }

  int productsNumber = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final productCubit = context.read<ProductCubit>();
        await productCubit.getProducts();
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                InfoActionRow(text: 'المنتجات'),
                SearchSection(),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return ItemsCountLabel(productsNumber: productsNumber);
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is GetProductsSuccessState) {
                productsNumber = state.products.length;
                return ProductsGridView(products: state.products);
              } else if (state is GetProductsErrorState) {
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
          ),
        ],
      ),
    );
  }
}
