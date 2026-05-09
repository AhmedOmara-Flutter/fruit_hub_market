import '../../../../core/utils/app_imports.dart';
import 'checkout_stepper_item.dart';

class CheckoutStepper extends StatelessWidget {
  final int currentIndex;
  final List<String> stepperTitles;
  final ValueChanged<int> onTap;

  const CheckoutStepper({
    super.key,
    required this.currentIndex,
    required this.stepperTitles,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        stepperTitles.length,
        (index) => GestureDetector(
          onTap: () => onTap(index),
          child: CheckoutStepperItem(
            isSelected: currentIndex == index,
            index: index + 1,
            text: stepperTitles[index],
          ),
        ),
      ),
    );
  }
}
