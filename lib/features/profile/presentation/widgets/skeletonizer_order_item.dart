import '../../../../core/utils/app_imports.dart';
import 'order_item_content.dart';
import 'order_item_image.dart';

class SkeletonizerOrderItem extends StatelessWidget {

  const SkeletonizerOrderItem({super.key,});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom:10,left: 15),
        margin: EdgeInsets.only(bottom:15,left: 20,right: 20),
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
                      orderId: 'omrnrijnbinrnmn',
                      orderDate: 'mioni nin iniuiiniooi',
                      numberOfOrders: 555,
                      ordersTotalPrice: 78888,
                      products: 'jniniunin jinin',
                      price: 'rgji rnr' ,
                    ),
                  ),
                ],
              ),
            ),
            OrderStatusBadge(
              color: Colors.grey.shade100,
              title:'rd]hghhkjjhv',
            ),
          ],
        ),
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