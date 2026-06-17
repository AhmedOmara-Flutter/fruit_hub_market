import 'package:dartz/dartz.dart';
import '../../errors/failure.dart';
import '../../entities/product_entity.dart';

abstract class ProductRepo {
  Stream<Either<Failure, List<ProductEntity>>> getProducts();
  Stream<Either<Failure, List<ProductEntity>>> getSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);
  Future<Either<Failure,void>>increaseSellingCount(String productId);
  Stream<Either<Failure,List<ProductEntity>>>getFilteredProducts(String category);

}
