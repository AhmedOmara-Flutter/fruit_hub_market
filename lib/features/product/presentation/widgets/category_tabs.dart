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

  final categories = [
    'فواكه',
    'خضروات',
    'مشروبات',
    'مكسرات',
    'عصاير',
    'تنوعات'
  ];

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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,

              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),

              indicatorSize: TabBarIndicatorSize.tab,

              labelColor:AppColor.mainColor ,
              unselectedLabelColor: Colors.black87,

              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),

              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.5,
              ),

              labelPadding: const EdgeInsets.symmetric(horizontal: 6),

              splashBorderRadius: BorderRadius.circular(30),

              overlayColor: WidgetStateProperty.all(Colors.transparent),

              tabs: categories.map((e) {
                return Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade100,
                    ),
                    child: Text(e),
                  ),
                );
              }).toList(),
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
