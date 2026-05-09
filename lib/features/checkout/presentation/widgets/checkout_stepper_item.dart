import '../../../../core/utils/app_imports.dart';
import 'active_step_item.dart';
import 'inactive_step_item.dart';

class CheckoutStepperItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final int index;

  const CheckoutStepperItem({
    super.key,
    required this.isSelected,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveStepItem(text: text)
        : InActiveStepItem(text: text, index: index);
  }
}
