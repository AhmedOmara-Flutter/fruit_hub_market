import '../../../../core/utils/app_imports.dart';
import '../../../../core/widgets/products_grid_view.dart';
import '../view_model/home_cubit.dart';

class BestSellingMoreViewBody extends StatefulWidget {
  const BestSellingMoreViewBody({super.key});

  @override
  State<BestSellingMoreViewBody> createState() =>
      _BestSellingMoreViewBodyState();
}

class _BestSellingMoreViewBodyState extends State<BestSellingMoreViewBody> {
  @override
  void initState() {
    final cubit = context.read<HomeCubit>();

    if (cubit.sellingProducts.isEmpty) {
      cubit.getSellingProducts();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: InfoActionRow(text: 'الأكثر مبيعا', isBack: true),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetSellingProductsSuccessState) {
              return ProductsGridView(
                products: state.sellingProducts,
              );
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
        ),
      ],
    );
  }
}
