import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/cart/presentation/view_model/cart_cubit.dart';


class MainView extends StatelessWidget {
  const MainView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),

      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartAdded) {
            customShowSnakeBar(context, color: Color(0xff1B5E37),
                label: 'تم إضافة المنتج إلى السلة');
          } else if (state is CartRemoved) {
            customShowSnakeBar(context, color: Color(0xff1B5E37),
                label: 'تم حذف المنتج من السلة');
          }
        },
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
    );
  }
}
