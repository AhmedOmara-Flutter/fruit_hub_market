import 'package:fruit_hub_market/features/cart/presentation/widgets/quality_control.dart';

import '../../../../core/utils/app_imports.dart';
import 'cart_item_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          CartItemImage(),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'فراوله',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.copyWith(color: Colors.black),
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: Colors.grey,
                      size: width * 0.06,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '3 كجم',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Color(0xffF4A91F)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QualityControl(),
                    Text(
                      '60 جنيه',
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
