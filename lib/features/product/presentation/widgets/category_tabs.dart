import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cubit/product_cubit/product_cubit.dart';
import '../../../../core/utils/app_imports.dart';
import 'tap_bar_view_body.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs>
    with SingleTickerProviderStateMixin {
  final categories = const [
    'بيتزا',
    'كريب لحوم',
    'كريب دجاج',
    'كريب ميكس',
    'سندوتشات سوري',
    'مكرونات',
    'مشويات',
    'حواوشي ايطالي',
    'برجر',
    'فطائر',
    'اضافات',
  ];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: categories.length,
      vsync: this,
    );

    // initial load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().filterByCategory(categories[0]);
    });

    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;

    final category = categories[_tabController.index];

    context.read<ProductCubit>().filterByCategory(category);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: AppColor.textSecondary,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
            dividerColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashBorderRadius: BorderRadius.circular(25.r),
            tabs: categories.map((e) {
              return Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  child: Text(e),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: categories.map((category) {
              return TapBarViewBody(category);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
// final categories = const [
//   'بيتزا'=>صغير وسط كبير
//   'كريب لحوم',=>مفيش احجام
//   'كريب دجاج',=>مفيش احجام
//   'كريب ميكس',=>مفيش احجام
//   'سندوتشات سوري',=>صغير كبير
//   'مكرونات',=>صغير كبير
//   'مشويات',=>مفيش احجام
//   'حواوشي ايطالي',=>مفيش احجام
//   'برجر',=>صغير كبير
//   'فطائر',
//   'اضافات',
// ];
