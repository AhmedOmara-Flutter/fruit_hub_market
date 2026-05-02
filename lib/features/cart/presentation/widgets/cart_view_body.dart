import 'package:fruit_hub_market/features/cart/presentation/widgets/cart_info_banner.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/cart_cubit.dart';
import 'cart_item_list.dart';

class CartViewBody extends StatelessWidget {

  const CartViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  InfoActionRow(text: 'السله'),
                  CartInfoBanner(productsInCart: cubit.cart.cartItems.length,),
                  SizedBox(height: 20),
                ],
              ),
            ),
            CartItemList(cartItem:cubit.cart.cartItems,),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  CustomButton(
                    child: Text(
                      'الدفع ${cubit.cart.getTotalPrice()} جنيه',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall,
                    ),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
