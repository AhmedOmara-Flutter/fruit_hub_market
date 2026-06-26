import 'dart:io';
import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';
import '../../widgets/custom_image_picker.dart';
import '../../widgets/order_review/delivery_address_section.dart';
import '../../widgets/order_review/order_review_button_section.dart';
import '../../widgets/order_review/order_summary_section.dart';

class ReviewOrderView extends StatefulWidget {
  const ReviewOrderView({super.key});

  @override
  State<ReviewOrderView> createState() => _ReviewOrderViewState();
}

class _ReviewOrderViewState extends State<ReviewOrderView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        return SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ملخص الطلب :',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      OrderSummarySection(
                        totalPrice: cubit.orderEntity.cartEntity
                            .getTotalPrice()
                            .toDouble(),
                        delivery: cubit.orderEntity.selectedLocationEntity!.cost,
                      ),
                      SizedBox(height: 10),
                      DeliveryInfoSection(
                        locationName:
                            cubit.orderEntity.selectedLocationEntity!.title,
                        deliveryCost:
                            cubit.orderEntity.selectedLocationEntity!.cost,
                        fullAddress: cubit.orderEntity.getFullAddress(),
                        onEdit: () {
                          cubit.pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      if(cubit.orderEntity.isCashOnDelivery==false)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F3F3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'اضافه بيانات الدفع',
                                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColor.mainColor.withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: AppColor.mainColor),
                                    ),
                                    child:  Row(
                                      children: [
                                        Icon(Icons.info_outline, color: AppColor.mainColor),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'يرجى إرفاق صورة واضحة لإثبات الدفع (إنستاباي، فودافون كاش، تحويل بنكي).\nرقم التحويل: 01204391511',
                                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              color: Color(0xff4E5556),
                                              fontSize: 11
                                            ),
                  
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                  
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                               CustomImagePicker(
                                onImagePicked: (image) {
                                  cubit.orderEntity.paymentFileImage = image;
                                },
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      OrderReviewButtonSection(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
