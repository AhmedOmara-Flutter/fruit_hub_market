import 'package:fruit_hub_market/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_market/features/checkout/domain/entities/order_entity.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/profile_cubit.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: InfoActionRow(text: 'طلباتي', isBack: true)),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileGetOrdersSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      OrderItem(orderEntity: state.orders[index]),
                  childCount: state.orders.length,
                ),
              );
            }
            if (state is ProfileGetOrdersError) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.errMessage)),
              );
            }
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          OrderItemImage(),
          SizedBox(width: 10),
          OrderItemContent(
            orderId: '87452658452',
            orderDate: getDateFormate(orderEntity.createdAt!.toString()),
            numberOfOrders: orderEntity.cartEntity.getItemsCount(),
            ordersTotalPrice: orderEntity.cartEntity.getTotalPrice(),
          ),
        ],
      ),
    );
  }
}

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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'طلب رقم : $orderId#',
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: Colors.black),
          ),
          SizedBox(height: 2),
          Text(
            'تم الطلب : $orderDate ',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Color(0xff949D9E)),
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

class OrderItemImage extends StatelessWidget {
  const OrderItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEBF9F1),
      ),
      child: SvgPicture.asset(Assets.images.package.path),
    );
  }
}
