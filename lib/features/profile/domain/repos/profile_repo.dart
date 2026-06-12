import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/entities/order_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrder(String uId);
}
