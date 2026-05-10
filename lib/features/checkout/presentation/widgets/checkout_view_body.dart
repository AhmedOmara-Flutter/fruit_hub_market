import '../../../../core/utils/app_imports.dart';
import '../view/address_page_view.dart';
import '../view/payment_page_view.dart';
import '../view/shipping_page_view.dart';
import 'checkout_stepper.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  final PageController _pageController = PageController();

  final List<String> stepperTitles = [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
  final List<String> stepperButtonLabels = [
    'التالي',
    'التالي',
    'تأكيد الطلب',
  ];

  final List<Widget> stepperPages = const [
    ShippingPageView(),
    AddressPageView(),
    PaymentPageView(),
  ];

  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentIndex == stepperPages.length - 1) {
       Navigator.pushNamed(context, RouteManager.paymentSuccess);
    }else {
      _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoActionRow(
          text: stepperTitles[currentIndex],
          isBack: true,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CheckoutStepper(
                  currentIndex: currentIndex,
                  stepperTitles: stepperTitles,
                  onTap: changePage,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stepperPages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return stepperPages[index];
                    },
                  ),
                ),
                CustomButton(
                    onPressed: () {
                      nextPage();
                    },
                    child: Text(
                      stepperButtonLabels[currentIndex],
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall,
                    )),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
