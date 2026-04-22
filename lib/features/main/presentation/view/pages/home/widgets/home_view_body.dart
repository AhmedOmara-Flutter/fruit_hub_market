import 'package:fruit_hub_market/features/main/presentation/view/pages/home/widgets/products_grid_view_bloc_builder.dart';

import '../../../../../../../core/utils/app_imports.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
            ],
          ),
        ),
        ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
