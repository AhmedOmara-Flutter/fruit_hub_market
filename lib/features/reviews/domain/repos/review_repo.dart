import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/errors/failure.dart';
import 'package:fruit_hub_market/features/reviews/domain/entities/review_entity.dart';

abstract class ReviewRepo {
  Future<Either<Failure, void>> addReview(
      ReviewEntity review,
      String productId,
      );

  Future<Either<Failure, List<ReviewEntity>>> getReviews(
      String productId,
      );
}