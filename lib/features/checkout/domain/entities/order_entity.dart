import 'package:fruit_hub_market/features/cart/presentation/widgets/cart_item.dart';

import 'address_entity.dart';

class OrderEntity {
  final CartItem cartItem;
  final bool ?isCashOnDelivery;
  final AddressEntity ?addressEntity;

  OrderEntity({
    required this.cartItem,
     this.isCashOnDelivery,
     this.addressEntity,
  });
}
