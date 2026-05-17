import '../../../../core/utils/app_imports.dart';

class OrderItemContent extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final int numberOfOrders;
  final double ordersTotalPrice;

  const OrderItemContent({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.numberOfOrders,
    required this.ordersTotalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'طلب رقم : $orderId#',
                      style: Theme
                          .of(
                        context,
                      )
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'تم الطلب : $orderDate ',
                      style: Theme
                          .of(
                        context,
                      )
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Color(0xff949D9E)),
                    ),
                  ],
                ),
              ),

              IconButton(onPressed: () {}, icon:SvgPicture.asset(Assets.images.arrowDown.path))
            ],
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: ' عدد الطلبات : ',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: Color(0xff949D9E)),
              children: [
                TextSpan(
                  text: '$numberOfOrders   ',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: Colors.black),
                ),
                TextSpan(
                  text: '$ordersTotalPrice جنية',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
