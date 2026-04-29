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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BestSellingCubit>().getSellingProducts();
      context.read<FeaturedCubit>().getFeaturedProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor:Color(0xff1B5E37),
      color: Color(0xffFFFFFF),
      onRefresh: () async {
        final bestSellingCubit = context.read<BestSellingCubit>();
        final featuredCubit = context.read<FeaturedCubit>();

        await bestSellingCubit.getSellingProducts();
        await featuredCubit.getFeaturedProducts();
      },
      child: CustomScrollView(
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
      ),
    );
  }
}
