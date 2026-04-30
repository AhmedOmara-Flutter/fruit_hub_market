import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/cart/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cart = CartEntity(cartItems: []);

  void addProduct(ProductEntity product) {
    bool isExist = cart.isExist(product);
    if (isExist) {
      for (var element in cart.cartItems) {
        if (element.product.code == product.code) {
          element.quantity++;
        }
      }
    } else {
      CartItemEntity cartItem = CartItemEntity(product: product, quantity: 1);
      cart.addCartItem(cartItem);
    }
    emit(CartAdded());
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cart.removeCartItem(cartItem);
    emit(CartRemoved());
  }

  void updateCartItem() {
    emit(CartUpdated());
  }
}
