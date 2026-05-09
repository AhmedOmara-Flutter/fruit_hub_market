import '../../../../core/utils/app_imports.dart';
import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutViewBody(),
    );
  }
}
