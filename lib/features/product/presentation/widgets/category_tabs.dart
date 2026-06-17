import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_market/features/product/presentation/widgets/tap_bar_view_body.dart';
import '../../../../core/cubit/product_cubit/product_cubit.dart';
import '../../../../core/utils/app_color.dart';


class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs>
    with SingleTickerProviderStateMixin {

  final categories = ['فواكه', 'خضروات', 'مشروبات', 'مكسرات'];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: categories.length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().filterByCategory(categories[0]);
    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      context.read<ProductCubit>().filterByCategory(
        categories[_tabController.index],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          Material(
            color: Colors.white,
            child: TabBar(
              isScrollable: false,
              indicatorColor: AppColor.mainColor,
              labelColor: AppColor.mainColor,
              labelStyle: Theme.of(context).textTheme.titleMedium!,
              tabs: categories.map((e) => Tab(text: e)).toList(),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: categories.map((category) {
                return TapBarViewBody(category);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
