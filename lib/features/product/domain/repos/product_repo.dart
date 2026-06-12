import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);
  Future<Either<Failure,void>>increaseSellingCount(String productId);
}
