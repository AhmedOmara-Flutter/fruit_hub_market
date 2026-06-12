import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/errors/failure.dart';
import 'package:fruit_hub_market/core/entities/order_entity.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity);

}
