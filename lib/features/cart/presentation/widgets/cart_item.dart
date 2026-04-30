import 'package:fruit_hub_market/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub_market/features/cart/presentation/widgets/quality_control.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/cart_cubit.dart';
import 'cart_item_image.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;

  const CartItem({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.3),
          top: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CartItemImage(image: cartItemEntity.product.image!),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItemEntity.product.name,
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.copyWith(color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().deleteCartItem(
                            cartItemEntity);
                      },
                      icon: Icon(Icons.delete_outline,
                        color: Colors.grey,
                        size: 25,),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  cartItemEntity.totalWeightText,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Color(0xffF4A91F)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QualityControl(cartItemEntity: cartItemEntity),
                    Text(
                      '${cartItemEntity.totalPrice} جنيه',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Color(0xffF4A91F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
