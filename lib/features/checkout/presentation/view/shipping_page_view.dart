import 'package:fruit_hub_market/features/checkout/presentation/view_model/checkout_cubit.dart';

import '../../../../core/utils/app_imports.dart';
import '../widgets/shipping_button_section.dart';
import '../widgets/shipping_methods_section.dart';

class ShippingPageView extends StatefulWidget {
  const ShippingPageView({super.key});

  @override
  State<ShippingPageView> createState() => _ShippingPageViewState();
}

class _ShippingPageViewState extends State<ShippingPageView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            ShippingMethodsSection(),
            ShippingButtonSection(),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}