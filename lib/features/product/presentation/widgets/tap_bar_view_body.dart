import 'package:fruit_hub_market/core/widgets/empty_widget.dart';
import '../../../../core/cubit/product_cubit/product_cubit.dart';
import '../../../../core/utils/app_imports.dart';
import '../../../../core/widgets/product_item.dart';

class TapBarViewBody extends StatelessWidget {
  final String category;

  const TapBarViewBody(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        final products = cubit.allProducts
            .where((p) => p.category == category)
            .toList();

        if (state is GetProductsLoadingState) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return Skeletonizer(child: ProductItem(product: getDummyProduct));
            },
          );
        }

        if (products.isEmpty) {
          return const EmptyWidget();
        }

        if (state is GetFilteredProductsError) {
          return Center(child: Text(state.errMessage));
        }
        return GridView.builder(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .70,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.w,
          ),
          itemBuilder: (context, index) {
            return ProductItem(product: products[index]);
          },
        );
      },
    );
  }
}
