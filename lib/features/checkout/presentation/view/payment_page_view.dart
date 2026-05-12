import 'package:fruit_hub_market/features/checkout/presentation/widgets/payment_button_section.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/checkout_cubit.dart';
import '../widgets/address_button_section.dart';
import '../widgets/delivery_address_section.dart';
import '../widgets/order_summary_section.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        return SafeArea(
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
                totalPrice: cubit.orderEntity.cartEntity.getTotalPrice(),
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
            PaymentButtonSection(),
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
