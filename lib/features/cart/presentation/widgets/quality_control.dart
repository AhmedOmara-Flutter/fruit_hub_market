import 'package:fruit_hub_market/features/cart/domain/entities/cart_item_entity.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/cart_cubit.dart';

class QualityControl extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  final double buttonSize;
  const QualityControl({
    super.key, this.buttonSize = 35, required this.cartItemEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    var cubit = context.read<CartCubit>();
    return Row(
      children: [
        Container(
          width: buttonSize,
          height: buttonSize,
          decoration: const BoxDecoration(
            color: Color(0xff1B5E37),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
             cubit.increaseCartItem(cartItemEntity);
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: buttonSize * 0.5,
            ),
          ),
        ),
        SizedBox(width: 15),
        Text(
          '${cartItemEntity.quantity}',
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: Colors.black),
        ),

        SizedBox(width: 15),

        Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
             cubit.decreaseCartItem(cartItemEntity);
            },
            icon: Icon(Icons.remove, size: buttonSize * 0.5),
          ),
        ),
      ],
    );
  },
);
  }
}
