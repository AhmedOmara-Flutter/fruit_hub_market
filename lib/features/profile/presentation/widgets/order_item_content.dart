import '../../../../core/utils/app_imports.dart';

class OrderItemContent extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final String products;
  final int numberOfOrders;
  final double ordersTotalPrice;
  final String price;
  final double deliveryCost;


  const OrderItemContent({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.numberOfOrders,
    required this.ordersTotalPrice,
    required this.products, required this.price, required this.deliveryCost,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = AppColor.mainColor;
    const greyText = Color(0xff7A7A7A);

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Order ID
          Row(
            children: [
              Text(
                'طلب رقم : ',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: primaryGreen,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '#$orderId',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black87,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// Order Date
          Text(
            'تم الطلب : $orderDate',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: greyText,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                products,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  color: AppColor.mainColor,
                ),
              ),
              Text(
                price,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(
                  color: AppColor.mainColor,
                ),
              ),
            ],
          ),


          const SizedBox(height: 12),

          /// Bottom Info
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 18,
                  color: primaryGreen,
                ),
                const SizedBox(width: 6),
                Text(
                  '$numberOfOrders منتجات',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: primaryGreen,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${ordersTotalPrice.toStringAsFixed(0)} جنيه',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+$deliveryCost',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(
                        color: Colors.amber.shade800,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}