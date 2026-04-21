import 'package:fruit_hub_market/core/utils/app_imports.dart';

class HomeViewBody extends StatefulWidget {

  const HomeViewBody({super.key,});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getProducts();
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
