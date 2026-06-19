import 'dart:async';

import 'package:fruit_hub_market/core/entities/order_entity.dart';

import '../../../../core/repos/order_repo/order_repo.dart';
import '../../../../core/utils/app_imports.dart';
import '../view/pages/address_page_view.dart';
import '../view/pages/payment_method_view.dart';
import '../view/pages/review_order_view.dart';
import '../view/pages/select_location_view.dart';

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

  final List<String> stepperTitles = ['الدفع', 'المكان', 'العنوان', 'مراجعه'];
  final List<Widget> stepperPages = const [
    PaymentMethodView(),
    SelectLocationView(),
    AddressPageView(),
    ReviewOrderView(),
  ];
  late List<Map<String, String>> paymentOptions = [
    {
      "title": "الدفع عند الاستلام",
      "subtitle": "التسليم الي المكان",
      "price": "${orderEntity.cartEntity.getTotalPrice()} جنيه",
    },
    {
      "title": "الدفع اونلاين",
      "subtitle": "يرجي تحديد طريقه الدفع",
      "price": "${orderEntity.cartEntity.getTotalPrice()} جنيه",
    },
  ];
  late List<Map<String, String>> placesOptions = [
    {
      "title": "طنطا",
      "subtitle": "اختر عنوانك داخل طنطا",
      "price": "10",
    },
    {
      "title": "كفر الزيات",
      "subtitle": "اختر عنوانك داخل كفر الزيات",
      "price": "15",
    },
    {
      "title": "بسيون",
      "subtitle": "اختر عنوانك داخل بسيون",
      "price": "20",
    },
    {
      "title": "دفرة",
      "subtitle": "اختر عنوانك داخل دفرة",
      "price": "30",
    },
    {
      "title": "السنطة",
      "subtitle": "اختر عنوانك داخل السنطة",
      "price": "50",
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
