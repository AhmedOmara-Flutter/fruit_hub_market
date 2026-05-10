import '../../../../core/utils/app_imports.dart';
import '../view/address_page_view.dart';
import '../view/order_tracking_view.dart';
import '../view/payment_page_view.dart';
import '../view/review_page_view.dart';
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
    'المراجعة',
  ];
  final List<String> stepperButtonLabels = [
    'التالي',
    'التالي',
    'تأكيد & استمرار',
    'تأكيد الطلب',
  ];

  final List<Widget> stepperPages = const [
    ShippingPageView(),
    AddressPageView(),
    PaymentPageView(),
    ReviewPageView(),
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
// import 'package:fruit_hub_market/features/checkout/presentation/view/shipping_page_view.dart';
// import 'package:fruit_hub_market/features/checkout/presentation/view/payment_page_view.dart';
//
// import '../../../../core/utils/app_imports.dart';
// import '../view/address_page_view.dart';
// import '../view/order_tracking_view.dart';
//
// class CheckoutViewBody extends StatefulWidget {
//   const CheckoutViewBody({super.key});
//
//   @override
//   State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
// }
//
// class _CheckoutViewBodyState extends State<CheckoutViewBody> {
//   final PageController _pageController = PageController();
//   List<String> stepperTitles = ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
//   List<Widget> stepperWidgets = [
//     CartPageView(),
//     AddressPageView(),
//     PaymentPageView(),
//     OrderTrackingPageView()
//   ];
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InfoActionRow(text: stepperTitles[currentIndex], isBack: true),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(
//                     stepperTitles.length,
//                         (index) =>
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               currentIndex = index;
//                             });
//                           },
//                           child: GetStepperItem(
//                             isSelected: currentIndex == index,
//                             index: index + 1,
//                             text: stepperTitles[index],
//                           ),
//                         ),
//                   ),
//                 ),
//                 Expanded(
//                   child: PageView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     onPageChanged: (value) {
//                       setState(() {
//                         currentIndex = value;
//                       });
//                     },
//                     itemCount: stepperTitles.length,
//                     controller: _pageController,
//                     itemBuilder: (BuildContext context, int index) {
//                       return stepperWidgets[currentIndex];
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class GetStepperItem extends StatelessWidget {
//   final bool isSelected;
//   final String text;
//   final int index;
//
//   const GetStepperItem({
//     super.key,
//     required this.isSelected,
//     required this.text,
//     required this.index,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return isSelected
//         ? ActiveItem(text: text)
//         : InActiveItem(text: text, index: index);
//   }
// }
//
// class ActiveItem extends StatelessWidget {
//   final String text;
//
//   const ActiveItem({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//             color: Color(0xff1B5E37),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(Icons.done, color: Colors.white, size: 20),
//         ),
//         SizedBox(width: 5),
//         Text(
//           text,
//           style: Theme
//               .of(
//             context,
//           )
//               .textTheme
//               .labelLarge!
//               .copyWith(color: Color(0xff1B5E37)),
//         ),
//       ],
//     );
//   }
// }
//
// class InActiveItem extends StatelessWidget {
//   final String text;
//   final int index;
//
//   const InActiveItem({super.key, required this.text, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 27,
//           width: 27,
//           decoration: BoxDecoration(
//             color: Color(0xffF2F3F3),
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//             child: Text(
//               '$index',
//               style: Theme
//                   .of(
//                 context,
//               )
//                   .textTheme
//                   .titleMedium!
//                   .copyWith(color: Colors.black),
//             ),
//           ),
//         ),
//         SizedBox(width: 5),
//         Text(
//           text,
//           style: Theme
//               .of(
//             context,
//           )
//               .textTheme
//               .labelLarge!
//               .copyWith(color: Color(0xff1B5E37)),
//         ),
//       ],
//     );
//   }
// }
