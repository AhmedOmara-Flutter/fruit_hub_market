import 'package:dartz/dartz.dart';
import '../../../product/domain/entities/product_entity.dart';

abstract class FavoriteRepo {
  Future<Either<String, bool>> toggleFavorite(ProductEntity product);
  Future<Either<String, List<ProductEntity>>> getFavoriteProducts();
}