import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/widgets/best_selling_header.dart';
import 'package:fruit_hub_market/features/home/widgets/featured_list.dart';
import 'package:fruit_hub_market/features/home/widgets/products_grid_view.dart';
import 'package:fruit_hub_market/features/home/widgets/search_section.dart';

class HomeViewBody extends StatelessWidget {

  const HomeViewBody({super.key,});


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
                ]),
          ),
          ProductsGridView(),

        ]
    );
  }
}
