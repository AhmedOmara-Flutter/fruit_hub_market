import '../../../cart/domain/entities/cart_entity.dart';
import 'address_entity.dart';

class OrderEntity {
  final String ?id;
  final String uId;
  final CartEntity cartEntity;
  bool ?isCashOnDelivery;
  AddressEntity ?addressEntity;

  OrderEntity({
    required this.cartEntity,
     this.isCashOnDelivery,
     this.addressEntity,
    required this.uId,this.id,
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
