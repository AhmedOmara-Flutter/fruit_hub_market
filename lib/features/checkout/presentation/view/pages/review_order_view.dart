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
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColor.textPrimary,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      OrderSummarySection(
                        totalPrice:
                        cubit.orderEntity.cartEntity.getTotalPrice().toDouble(),
                        delivery:
                        cubit.orderEntity.selectedLocationEntity!.cost,
                      ),

                      SizedBox(height: 10.h),

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

                      SizedBox(height: 10.h),

                      if (cubit.orderEntity.isCashOnDelivery == false)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.card,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColor.border),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'اضافه بيانات الدفع',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                        color: AppColor.textPrimary,
                                      ),
                                    ),

                                    SizedBox(height: 10.h),

                                    Container(
                                      padding: EdgeInsets.all(12.r),
                                      decoration: BoxDecoration(
                                        color: AppColor.mainColor
                                            .withOpacity(0.08),
                                        borderRadius:
                                        BorderRadius.circular(12.r),
                                        border: Border.all(
                                          color: AppColor.mainColor,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            color: AppColor.mainColor,
                                            size: 20.sp,
                                          ),

                                          SizedBox(width: 8.w),

                                          Expanded(
                                            child: Text(
                                              'يرجى إرفاق صورة واضحة لإثبات الدفع (إنستاباي، فودافون كاش، تحويل بنكي).\nرقم التحويل: 01204391511',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                color:
                                                AppColor.textSecondary,
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 5.w),

                              CustomImagePicker(
                                onImagePicked: (image) {
                                  cubit.orderEntity.paymentFileImage = image;
                                },
                              ),
                            ],
                          ),
                        ),

                      const Spacer(),
                      SizedBox(height: 30.h),

                      OrderReviewButtonSection(),

                      SizedBox(height: 30.h),
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