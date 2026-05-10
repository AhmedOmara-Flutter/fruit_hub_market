import '../../../../core/utils/app_imports.dart';
import '../widgets/card_information_section.dart';
import '../widgets/payment_method_section.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentMethodSection(),
          SizedBox(height: 20,),
          CardInformationSection(),
        ],
      ),
    );
  }
}


