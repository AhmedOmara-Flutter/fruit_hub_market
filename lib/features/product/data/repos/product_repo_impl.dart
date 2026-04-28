import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/product/data/models/product_model.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';
import 'package:fruit_hub_market/features/product/domain/repos/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices _databaseServices;

  ProductRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final data = await _databaseServices.getData(path: 'products',)as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((product) => ProductModel.fromJson(product).toEntity())
          .toList();
      return Right(products);
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSellingProducts()async{
    try {
      final data = await _databaseServices.getData(
        path: 'products',
        query: {
          'limit': 10,
          'orderBy': 'sellingCount',
          'descending': true,
        },
      )as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((product) => ProductModel.fromJson(product).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString().replaceAll('Exception: ', '')));
    }
  }
}
