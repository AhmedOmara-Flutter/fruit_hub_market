import '../../../../core/utils/app_imports.dart';

class PaymentButtonSection extends StatelessWidget {
  const PaymentButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: (){
        Navigator.pushNamed(context, RouteManager.paymentSuccess);

      },
      child: Text('تاكيد الطلب', style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
