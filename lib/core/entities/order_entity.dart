import 'package:fruit_hub_market/core/entities/selected_location_entity.dart';

import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/cart/domain/entities/cart_entity.dart';
import '../enums/order_enum.dart';
import 'address_entity.dart';

class OrderEntity {
  String ?id;
  final String uId;
  final DateTime ?createdAt;
  final CartEntity cartEntity;
  final UserEntity ?userEntity;
  bool ?isCashOnDelivery;
  AddressEntity ?addressEntity;
  SelectedLocationEntity ?selectedLocationEntity;
  final OrderStatus status;


  OrderEntity({
    required this.cartEntity,
     this.isCashOnDelivery,
     this.addressEntity,
    required this.uId,this.id,this.createdAt,
    this.userEntity,
    required this.status,
    this.selectedLocationEntity,
  });

  String getFullAddress(){
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
