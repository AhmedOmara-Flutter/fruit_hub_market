import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/errors/failure.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/services/database_services.dart';
import 'package:fruit_hub_market/features/checkout/domain/entities/order_entity.dart';

import '../../../checkout/data/models/order_model.dart';
import '../../domain/repos/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final DatabaseServices _databaseServices;

  CheckoutRepoImpl(this._databaseServices);


  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      final order = await _databaseServices.addData(
        path: 'orders',
        data: OrderModel.fromEntity(orderEntity).toJson(),
        uId: getUser().uId,
      );
      return Right(order);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
