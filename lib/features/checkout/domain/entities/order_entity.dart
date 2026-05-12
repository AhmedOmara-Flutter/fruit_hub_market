import 'package:fruit_hub_market/features/cart/presentation/widgets/cart_item.dart';

import '../../../cart/domain/entities/cart_entity.dart';
import 'address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool ?isCashOnDelivery;
   AddressEntity ?addressEntity;

  OrderEntity({
    required this.cartEntity,
     this.isCashOnDelivery,
     this.addressEntity,
  });


  @override
  String toString(){
    return 'OrderEntity(cartEntity: $cartEntity, isCashOnDelivery: $isCashOnDelivery, addressEntity: $addressEntity)';
  }

  String getFullAddress(){
    return '${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
