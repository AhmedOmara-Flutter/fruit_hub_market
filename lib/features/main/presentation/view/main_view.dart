import 'package:flutter/services.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/cart/presentation/view_model/cart_cubit.dart';

import '../../../favorite/presentation/view_model/favorite_cubit.dart';


class MainView extends StatefulWidget {
  const MainView({super.key,});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorites();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // نتحكم إحنا في الباك
      onPopInvoked: (didPop) {
        final cubit = context.read<MainCubit>();

        if (cubit.currentIndex != 0) {
          cubit.changeBottomNav(0);
        } else {
          // يقفل الابلكيشن
          SystemNavigator.pop();
        }
      },

      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        body: MultiBlocListener(
          listeners: [
            BlocListener<CartCubit, CartState>(listener: (context, state) {
              if (state is CartAdded) {
                customShowSnakeBar(context, color: Color(0xff1B5E37),
                    label: 'تم إضافة المنتج إلى السلة');
              }
              if (state is CartRemoved) {
                customShowSnakeBar(context, color: Color(0xff1B5E37),
                    label: 'تم حذف المنتج من السلة');
              }
            },),
            BlocListener<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                if (state is FavoriteAddedState) {
                  customShowSnakeBar(
                      context, color: Color(0xff1B5E37),
                      label: 'تمت الإضافة للمفضلة');
                }
                if (state is FavoriteDeletedState) {
                  customShowSnakeBar(
                      context, color: Colors.red, label: 'تم الحذف من المفضله');
                }
              },),
          ],
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              var cubit = context.read<MainCubit>();
              return IndexedStack(
                index: cubit.currentIndex,
                children: cubit.pages,
              );
            },
          ),
          ),
        ),
    );
  }
}
