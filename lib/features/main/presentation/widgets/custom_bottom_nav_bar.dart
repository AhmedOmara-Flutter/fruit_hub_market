import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/utils/app_imports.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
          decoration: BoxDecoration(
            color: AppColor.card,
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(
              color: AppColor.border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: SalomonBottomBar(
            backgroundColor: Colors.transparent,
            currentIndex: context.read<MainCubit>().currentIndex,
            onTap: (index) {
              context.read<MainCubit>().changeBottomNav(index);
            },

            selectedItemColor: AppColor.mainColor,
            unselectedItemColor: AppColor.textSecondary,

            margin: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),

            itemPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 10.h,
            ),

            items: [
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25.sp,
                ),
                title: Text(
                  "الرئيسية",
                  style: StyleManager.font13Weight600.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.restaurant_menu_rounded,
                  size: 25.sp,
                ),
                title: Text(
                  "المنيو",
                  style: StyleManager.font13Weight600.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  size: 25.sp,
                ),
                title: Text(
                  "السلة",
                  style: StyleManager.font13Weight600.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.person_rounded,
                  size: 25.sp,
                ),
                title: Text(
                  "حسابي",
                  style: StyleManager.font13Weight600.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}