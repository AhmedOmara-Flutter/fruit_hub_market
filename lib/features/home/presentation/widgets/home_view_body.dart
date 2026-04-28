import 'package:fruit_hub_market/core/widgets/products_grid_view.dart';
import 'package:fruit_hub_market/core/widgets/search_section.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/best_selling_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/featured_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/category_list.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/featured_list.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/home_header.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/popular_products_section.dart';

import '../../../../../../../core/utils/app_imports.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<BestSellingCubit>(context).getSellingProducts();
    BlocProvider.of<FeaturedCubit>(context).getFeaturedProducts();
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
              SizedBox(height: 20),
              FeaturedList(),
              SizedBox(height: 10),
              PopularProductsSection(),
              SizedBox(height: 10),
              BlocBuilder<FeaturedCubit, FeaturedState>(
                builder: (context, state) {
                 if (state is GetFeaturedProductsSuccessState) {
                    return SizedBox(
                        height: 80,
                        child: CategoryList(products: state.featuredProducts,));
                  }
                  else if (state is GetFeaturedProductsErrorState) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return Skeletonizer(
                      enabled: true,
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F5F7),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }

                },
              ),
              SizedBox(height: 10),
              BestSellingHeader(),
              SizedBox(height: 10),
            ],
          ),
        ),
        BlocBuilder<BestSellingCubit, BestSellingState>(
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
