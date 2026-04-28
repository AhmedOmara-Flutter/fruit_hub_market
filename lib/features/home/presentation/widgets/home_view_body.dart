import 'package:fruit_hub_market/core/widgets/products_grid_view.dart';
import 'package:fruit_hub_market/core/widgets/search_section.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/home_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/featured_list.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/home_header.dart';

import '../../../../../../../core/utils/app_imports.dart';

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
              SizedBox(height: 20),
              FeaturedList(),
              SizedBox(height: 10),
              BestSellingHeader(),
              SizedBox(height: 10),
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
