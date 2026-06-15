import '../../../../core/utils/app_imports.dart';

class OrderItemContent extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final String products;
  final int numberOfOrders;
  final double ordersTotalPrice;

  const OrderItemContent({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.numberOfOrders,
    required this.ordersTotalPrice,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = AppColor.mainColor;
    const greyText = Color(0xff7A7A7A);
    const darkGreyText = Color(0xff5F5F5F);

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

          /// Products
          Text(
            products,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: darkGreyText,
              height: 1.4,
            ),
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
                Text(
                  '${ordersTotalPrice.toStringAsFixed(0)} جنيه',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}