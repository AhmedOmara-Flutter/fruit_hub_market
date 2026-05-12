import '../../../cart/domain/entities/cart_entity.dart';
import 'address_entity.dart';

class OrderEntity {
  final String ?uId;
  final CartEntity cartEntity;
  bool ?isCashOnDelivery;
  AddressEntity ?addressEntity;

  OrderEntity({
    required this.cartEntity,
     this.isCashOnDelivery,
     this.addressEntity,
    this.uId,
  });


  @override
  String toString(){
    String data='OrderEntity(cartEntity: $cartEntity, isCashOnDelivery: $isCashOnDelivery, addressEntity: $addressEntity)';
    print(data);
    return data ;
  }

  String getFullAddress(){
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
