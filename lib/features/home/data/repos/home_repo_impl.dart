import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/errors/failure.dart';
import 'package:fruit_hub_market/core/services/database_services.dart';
import 'package:fruit_hub_market/features/home/data/models/product_model.dart';
import 'package:fruit_hub_market/features/home/domain/entities/product_entity.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DatabaseServices _databaseServices;

  HomeRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final data = await _databaseServices.getData(path: 'products')as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((product) => ProductModel.fromJson(product).toEntity())
          .toList();
      return Right(products);
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
