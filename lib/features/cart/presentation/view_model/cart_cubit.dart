import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/cart/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

import '../../../../core/helper_function/price_helper.dart';
import '../../../../core/services/cache_helper.dart';
import '../../../offers/domain/entities/offer_entity.dart';
import '../../../offers/presentation/view_model/offer_cubit.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../data/model/cart_model.dart';
import '../../domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    loadCart();
  }

  CartEntity cart = CartEntity(cartItems: []);

  Future<void> loadCart() async {
    final jsonString = CacheHelper.getData(key: 'cart');

    if (jsonString != null) {
      final data = jsonDecode(jsonString);
      final model = CartModel.fromJson(data);
      cart = model.toEntity();
      emit(CartLoaded());
    }
  }

  void addProduct(ProductEntity product, OfferEntity? offer) {
    final price = getFinalPrice(
      product: product,
      offer: offer,
    );
    bool isExist = cart.isExist(product);
    if (isExist) {
      for (var element in cart.cartItems) {
        if (element.product.code == product.code) {
          element.quantity++;
        }
      }
    } else {
      CartItemEntity cartItem = CartItemEntity(
          product: product, unitPrice: price, quantity: 1);
      cart.addCartItem(cartItem);
    }
    saveCart();
    emit(CartAdded());
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cart.removeCartItem(cartItem);
    saveCart();
    emit(CartRemoved());
  }

  void increaseCartItem(CartItemEntity item) {
    print('item $item');
    item.increase();
    saveCart();
    emit(CartIncrease());
  }
  void decreaseCartItem(CartItemEntity item) {
    item.decrease();
    saveCart();
    emit(CartDecrease());
  }

  Future saveCart() async {
    final model = CartModel.fromEntity(cart);
    String jsonData = jsonEncode(model.toJson());
    await CacheHelper.saveData(key: 'cart', value: jsonData);
  }

  //todo فهمها تاني
  num getCartItemPrice(
      CartItemEntity item,
      OfferCubit offerCubit,
      ) {
    final offer = offerCubit.offersMap[item.product.id];

    final unitPrice = getFinalPrice(
      product: item.product,
      offer: offer,
    );

    return unitPrice * item.quantity;
  }
}
