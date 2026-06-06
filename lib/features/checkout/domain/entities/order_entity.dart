import '../../../auth/domain/entities/user_entity.dart';
import '../../../cart/domain/entities/cart_entity.dart';
import 'address_entity.dart';

class OrderEntity {
  final String ?id;
  final String uId;
  final DateTime ?createdAt;
  final CartEntity cartEntity;
  final UserEntity ?userEntity;
  bool ?isCashOnDelivery;
  AddressEntity ?addressEntity;

  OrderEntity({
    required this.cartEntity,
     this.isCashOnDelivery,
     this.addressEntity,
    required this.uId,this.id,this.createdAt,
    this.userEntity,
  });


  @override
  String toString() {
    return '''
OrderEntity(
  uId: $uId,
  isCashOnDelivery: $isCashOnDelivery,

  address:
  $addressEntity,

  cart:
  $cartEntity
)
''';
  }

  String getFullAddress(){
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
