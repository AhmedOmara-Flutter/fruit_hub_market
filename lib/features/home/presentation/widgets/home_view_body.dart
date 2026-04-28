import 'package:fruit_hub_market/core/widgets/search_section.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/best_selling_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/featured_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/featured_list.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/home_header.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/popular_products_section.dart';

import '../../../../../../../core/utils/app_imports.dart';
import 'best_selling_products_bloc_builder.dart';
import 'featured_products_bloc_builder.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              SearchSection(),
              SizedBox(height: 20),
              FeaturedList(),
              SizedBox(height: 10),
              PopularProductsSection(),
              SizedBox(height: 10),
              FeaturedProductsBlocBuilder(),
              SizedBox(height: 10),
              BestSellingHeader(),
              SizedBox(height: 10),
            ],
          ),
        ),
        BestSellingProductsBlocBuilder(),
      ],
    );
  }
}
