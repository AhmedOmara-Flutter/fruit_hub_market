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
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal:  20,),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
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
            ),
          ),
        ],
      ),
    );
  }
}
