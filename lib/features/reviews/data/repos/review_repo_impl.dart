import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/errors/failure.dart';
import 'package:fruit_hub_market/core/services/database_services.dart';
import 'package:fruit_hub_market/features/reviews/data/models/review_model.dart';
import 'package:fruit_hub_market/features/reviews/domain/entities/review_entity.dart';
import 'package:fruit_hub_market/features/reviews/domain/repos/review_repo.dart';

class ReviewRepoImpl implements ReviewRepo {
  final DatabaseServices _databaseServices;

  ReviewRepoImpl(this._databaseServices);

  @override
  Future<Either<Failure, void>> addReview(
      ReviewEntity review,
      String productId,
      ) async {
    try {

      // 1. add review
      await _databaseServices.addData(
        path: 'products/$productId/reviews',
        data: ReviewModel.fromEntity(review).toJson(),
        uId: null,
      );

      // 2. get product safely
      final product = await _databaseServices.getData(
        path: 'products',
        uId: productId,
      )as Map<String, dynamic>;

      final currentCount = (product['reviewsCount'] ?? 0) as num;
      final currentSum = (product['ratingSum'] ?? 0) as num;

      final newCount = currentCount + 1;
      final newSum = currentSum + review.rating;
      final newAvg = newSum / newCount;

      // 3. update product
      await _databaseServices.updateData(
        path: 'products',
        docId: productId,
        data: {
          'reviewsCount': newCount,
          'ratingSum': newSum,
          'averageRating': newAvg,
        },
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews(
      String productId,
      ) async {
    try {
      final data = await _databaseServices.getData(
        path: 'products/$productId/reviews',
        query: {
          'orderBy': 'date',
          'descending': true
        }
      );

      List<ReviewEntity> reviews = (data as List)
          .map((e) => ReviewModel.fromJson(e).toEntity())
          .toList();

      return right(reviews);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }}
