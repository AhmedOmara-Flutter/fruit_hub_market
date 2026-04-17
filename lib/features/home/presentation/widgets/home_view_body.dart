import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/featured_list.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/products_grid_view.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/search_section.dart';

class HomeViewBody extends StatefulWidget {

  const HomeViewBody({super.key,});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getProducts();
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
                ]),
          ),
          ProductsGridView(),

        ]
    );
  }
}
