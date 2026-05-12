import 'package:fruit_hub_market/features/checkout/presentation/view_model/checkout_cubit.dart';

import '../../../../core/utils/app_imports.dart';

class PaymentButtonSection extends StatelessWidget {
  const PaymentButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        return CustomButton(
          onPressed: () {
            cubit.addOrder(cubit.orderEntity);
            Navigator.pushNamed(context, RouteManager.paymentSuccess);
          },
          child: Text('تاكيد الطلب', style: Theme
              .of(context)
              .textTheme
              .labelSmall),
        );
      },
    );
  }
}
