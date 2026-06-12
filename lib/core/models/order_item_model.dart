// import '../../../cart/data/model/cart_item_model.dart';
// import '../../../cart/domain/entities/cart_item_entity.dart';
//
// class OrderItemModel {
//   final String code;
//   final String name;
//   final String imageUrl;
//   final num price;
//   final int quantity;
//
//   OrderItemModel({
//     required this.code,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.quantity,
//   });
//
//   factory OrderItemModel.fromEntity(CartItemEntity entity) {
//     return OrderItemModel(
//       code: entity.product.code,
//       name: entity.product.name,
//       imageUrl: entity.product.image!,
//       price: entity.product.price,
//       quantity: entity.quantity,
//     );
//   }
//
//
//   CartItemEntity toEntity() {
//     return CartItemModel.fromJson({
//       'product': {
//         'code': code,
//         'name': name,
//         'image': imageUrl,
//         'price': price,
//       },
//       'quantity': quantity,
//     }).toEntity();
//   }
//   factory OrderItemModel.fromJson(Map<String, dynamic> json) {
//     return OrderItemModel(
//       code: json['code'],
//       name: json['name'],
//       imageUrl: json['imageUrl'],
//       price: json['price'],
//       quantity: json['quantity'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'code': code,
//       'name': name,
//       'imageUrl': imageUrl,
//       'price': price,
//       'quantity': quantity,
//     };
//
//   }
// }
import '../../features/cart/data/model/cart_item_model.dart';
import '../../features/cart/domain/entities/cart_item_entity.dart';
import 'product_model.dart';

class OrderItemModel {
  final String code;
  final String name;
  final String imageUrl;
  final num unitPrice;
  final int quantity;

  OrderItemModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.unitPrice,
    required this.quantity,
  });

  factory OrderItemModel.fromEntity(CartItemEntity entity) {
    return OrderItemModel(
      code: entity.product.code,
      name: entity.product.name,
      imageUrl: entity.product.image!,
      unitPrice: entity.unitPrice,
      quantity: entity.quantity,
    );
  }

  num get totalPrice => unitPrice * quantity;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'unitPrice': unitPrice,
      'quantity': quantity,
    };
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      code: json['code'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      unitPrice: json['unitPrice'],
      quantity: json['quantity'],
    );
  }

  CartItemEntity toEntity() {
    return CartItemModel(
      product: ProductModel.fromJson({
        'code': code,
        'name': name,
        'image': imageUrl,
        'price': unitPrice,
      }).toEntity(),
      unitPrice: unitPrice,
      quantity: quantity,
    );
  }
}