import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/checkout/domain/entities/order_entity.dart';

import '../../../checkout/data/models/order_model.dart';
import '../../domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final DatabaseServices _databaseServices;

  ProfileRepoImpl(this._databaseServices);


  @override
  Future<Either<Failure, List<OrderEntity>>> getOrder() async {
    try {
      final data = await _databaseServices.getData(
        path: 'orders',
        query: {
          'orderBy': 'createdAt',
          'descending': true,
        }
      ) as List<Map<String, dynamic>>;
      List<OrderEntity> orders = data.map((order) => OrderModel.fromJson(order).toEntity()).toList();

      return Right(orders);
    } catch (e) {
      print('error in getOrder method in profile repo impl : $e');
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

}
