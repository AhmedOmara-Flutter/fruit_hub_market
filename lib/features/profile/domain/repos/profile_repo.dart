import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../checkout/domain/entities/order_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrder();
}
