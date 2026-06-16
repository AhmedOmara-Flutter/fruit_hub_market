import 'dart:async';
import 'package:fruit_hub_market/core/entities/order_entity.dart';
import '../../../../core/utils/app_imports.dart';
import '../../../../core/repos/order_repo/order_repo.dart';
import '../view/address_page_view.dart';
import '../view/payment_page_view.dart';
import '../view/shipping_page_view.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.orderEntity, this._checkoutRepo)
    : super(CheckoutInitial());
  final OrderRepo _checkoutRepo;
  Timer? timer;

  OrderEntity orderEntity;
  final PageController pageController = PageController();
  int currentIndex = 0;
  bool? isCashOnDelivery;

  final List<String> stepperTitles = ['الشحن', 'العنوان', 'الدفع'];
  final List<Widget> stepperPages = const [
    ShippingPageView(),
    AddressPageView(),
    PaymentPageView(),
  ];
  late List<Map<String, String>> shippingOptions = [
    {
      "title": "الدفع عند الاستلام",
      "subtitle": "التسليم من المكان",
      "price": "${orderEntity.cartEntity.getTotalPrice()} جنيه",
    },
    {
      "title": "الدفع اونلاين",
      "subtitle": "يرجي تحديد طريقه الدفع",
      "price": "${orderEntity.cartEntity.getTotalPrice()} جنيه",
    },
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(CheckoutChangePage());
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void selectShipping(bool value) {
    isCashOnDelivery = value;
    emit(CheckoutSelectShipping());
  }

  Future<void> addOrder(OrderEntity orderEntity) async {
    emit(CheckoutAddOrderLoading());

    await Future.delayed(
      const Duration(seconds: 2),
    );
    final result = await _checkoutRepo.addOrder(orderEntity);

    result.fold(
          (failure) {
            debugPrint('ERROR: $failure');

            return emit(CheckoutAddOrderError(failure.errMessage));
      },
          (data) {
        print('data is id ${data}');
        orderEntity.id = data;
        emit(CheckoutAddOrderSuccess());
      },
    );
  }
  }
