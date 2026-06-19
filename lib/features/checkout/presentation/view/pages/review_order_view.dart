import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';
import '../../widgets/order_review/delivery_address_section.dart';
import '../../widgets/order_review/order_summary_section.dart';
import '../../widgets/order_review/order_review_button_section.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key});

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
                      SizedBox(height: 30),
                      Text(
                        'ملخص الطلب :',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      OrderSummarySection(
                        totalPrice: cubit.orderEntity.cartEntity.getTotalPrice().toDouble(),
                      ),
                      SizedBox(height: 10),
                      DeliveryAddressSection(
                        fullAddress: cubit.orderEntity.getFullAddress(),
                        onEdit: () {
                          cubit.pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
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
