import 'package:fruit_hub_market/features/checkout/presentation/widgets/shipping/shipping_method_item.dart';

import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';

class ShippingMethodsSection extends StatelessWidget {
  const ShippingMethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    return Expanded(
      child: ListView.separated(
        itemCount: cubit.shippingOptions.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = cubit.shippingOptions[index];
          final isSelected = cubit.isCashOnDelivery == (index == 0);
          return ShippingMethodItem(
            isSelected: isSelected,
            item: item,
            onTap: () {
              cubit.selectShipping(index == 0);
            },
          );
        },
      ),
    );
  }
}
