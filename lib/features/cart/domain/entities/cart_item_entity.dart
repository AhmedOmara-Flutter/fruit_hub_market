import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int quantity;

  CartItemEntity({
    required this.product,
    required this.quantity,
  });

  void increase() {
    quantity++;
  }

  void decrease() {
    if (quantity > 1) {
      quantity--;
    }
  }

  num get totalPrice {
    return product.price * quantity;
  }
}