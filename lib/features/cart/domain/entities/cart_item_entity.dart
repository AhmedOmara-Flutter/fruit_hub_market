import 'package:equatable/equatable.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int quantity;

  CartItemEntity({
    required this.product,
    this.quantity = 0,
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

  String get totalWeightText {
    final totalGrams = product.unitAmount * quantity;

    if (totalGrams < 1000) {
      return '$totalGrams جم';
    } else {
      final kg = totalGrams / 1000;
      return kg % 1 == 0
          ? '${kg.toInt()} كجم'
          : '${kg.toStringAsFixed(2)} كجم';
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [product, quantity];
}