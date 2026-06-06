import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../../../cart/domain/entities/cart_entity.dart';
import '../../domain/entities/order_entity.dart';
import 'address_model.dart';
import 'order_item_model.dart';

class OrderModel {
  final String uId;
  final String paymentMethod;
  final DateTime createdAt;
  final num totalPrice;
  final UserModel userModel;
  final AddressModel address;
  final List<OrderItemModel> items;
  String ?id;



  OrderModel({
    required this.uId,
    required this.paymentMethod,
    required this.address,
     required this.items,
    required this.totalPrice,
   required this.createdAt,
    this.id,
    required this.userModel,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      uId: entity.uId,
      id: entity.id,
      paymentMethod: entity.isCashOnDelivery == true ? 'Cash' : 'Online',
      createdAt: DateTime.now(),
      address: AddressModel.fromEntity(entity.addressEntity!),
      // totalPrice: entity.cartEntity.getTotalPrice() + Constants.delivery,
      totalPrice: entity.cartEntity.getTotalPrice(),
      items: entity.cartEntity.cartItems.map((cartItem) =>
          OrderItemModel.fromEntity(cartItem)).toList(),
      userModel: UserModel.fromEntity(entity.userEntity!),
    );

  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      uId: uId,
      createdAt: createdAt,
      isCashOnDelivery: paymentMethod == 'Cash' ? true : false,
      addressEntity: address.toEntity(),
      cartEntity: CartEntity(
        cartItems: items.map((item) => item.toEntity()).toList(),
      ),
      userEntity: userModel.toEntity(),
    );
  }
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['uId'],
      id: json['id'],
      totalPrice: json['totalPrice'],
      createdAt: (json['createdAt'] as Timestamp?)!.toDate(),
      address: AddressModel.fromJson(json['address']),
      paymentMethod: json['paymentMethod'],
      items: List<OrderItemModel>.from(
          json['items'].map((item) => OrderItemModel.fromJson(item))),
      userModel: UserModel.fromJson(json['userModel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'address': address.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
      'id':id,
      'userModel': userModel.toJson(),
    };
  }


}
