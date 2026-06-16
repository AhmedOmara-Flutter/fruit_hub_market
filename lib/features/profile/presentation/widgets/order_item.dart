import '../../../../core/enums/order_enum.dart';
import '../../../../core/helper_function/get_date_formate.dart';
import '../../../../core/utils/app_imports.dart';
import '../../../../core/entities/order_entity.dart';
import 'order_item_content.dart';
import 'order_item_image.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom:10,left: 15),
      margin: EdgeInsets.symmetric(horizontal:  20,),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F3),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                OrderItemImage(),
                SizedBox(width: 10),
                Expanded(
                  child: OrderItemContent(
                    orderId: orderEntity.id??'',
                    orderDate: getDateFormate(orderEntity.createdAt.toString()),
                    numberOfOrders: orderEntity.cartEntity.getItemsCount(),
                    ordersTotalPrice: orderEntity.cartEntity.getTotalPrice().toDouble(),
                    products: orderEntity.cartEntity.cartItems
                        .map((item) =>
                    '${item.product.name} × ${item.quantity}')
                        .join('\n'),
                    price: orderEntity.cartEntity.cartItems
                        .map((item) => '${item.unitPrice} ج.م ')
                        .join('\n'),
                  ),
                ),
              ],
            ),
          ),
          OrderStatusBadge(
            color: orderEntity.status.color,
            title: orderEntity.status.ar,
          ),
        ],
      ),
    );
  }
}

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
    super.key,
    required this.title, required this.color,
  });

  final String title;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: color.withOpacity(0.9),
        ),
      ),
    );
  }
}