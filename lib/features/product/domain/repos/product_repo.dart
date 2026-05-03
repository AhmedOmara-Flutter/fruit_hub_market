import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../search/domain/entity/product_search_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);
}
