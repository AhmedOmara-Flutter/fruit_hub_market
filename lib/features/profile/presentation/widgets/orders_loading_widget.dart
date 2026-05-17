import 'package:fruit_hub_market/features/profile/presentation/widgets/orders_view_body.dart';

import '../../../../core/utils/app_imports.dart';

class OrdersLoadingWidget extends StatelessWidget {
  const OrdersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: OrderItemContent(
        orderId: '846254852845',
        orderDate: '2548512154815141',
        numberOfOrders: 8555,
        ordersTotalPrice: 2548512,
      ),
    );
  }
}
