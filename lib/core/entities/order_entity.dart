import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/cart/domain/entities/cart_entity.dart';
import 'address_entity.dart';

class OrderEntity {
  final String ?id;
  final String uId;
  final DateTime ?createdAt;
  final CartEntity cartEntity;
  final UserEntity ?userEntity;
  bool ?isCashOnDelivery;
  AddressEntity ?addressEntity;
 // final String status;

  OrderEntity({
    required this.cartEntity,
     this.isCashOnDelivery,
     this.addressEntity,
    required this.uId,this.id,this.createdAt,
    this.userEntity,
  });

  String getFullAddress(){
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
