import 'package:fruit_hub_market/features/checkout/presentation/view_model/checkout_cubit.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/helper_function/get_date_formate.dart';
import '../../../../core/utils/app_imports.dart';
import 'order_time_line.dart';
class OrderTrackingViewBody extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderTrackingViewBody({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoActionRow(text: 'تتبع الطلب', showBack: true),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xffF2F3F3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffEBF9F1),
                ),
                child: SvgPicture.asset(Assets.images.package.path),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'طلب رقم : ',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '#${orderEntity.id}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            color: Colors.black87,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'تم الطلب : ${getDateFormate(
                          orderEntity.createdAt.toString())} ',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                        color: Color(0xff949D9E),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: ' عدد الطلبات : ',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Color(0xff949D9E)),
                        children: [
                          TextSpan(
                            text:
                            '${orderEntity.cartEntity.getItemsCount()}   ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text:
                            '${(orderEntity.cartEntity.getTotalPrice() +
                                orderEntity.selectedLocationEntity!.cost)
                                .toStringAsFixed(2)} ج.م',
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        OrderTimeline(status: orderEntity.status),
      ],
    );
  }
}
