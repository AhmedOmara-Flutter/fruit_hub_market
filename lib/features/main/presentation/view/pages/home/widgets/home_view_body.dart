import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../core/helper_function/get_dummy_products.dart';
import '../../../../../../../core/utils/app_imports.dart';
import '../view_model/home_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              HomeHeader(),
              SearchSection(),
              FeaturedList(),
              BestSellingHeader(),
              SizedBox(height: 20),
            ],
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
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
        ),
      ],
    );
  }
}
