import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_imports.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repos/review_repo.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this._repo) : super(ReviewInitial());
  final ReviewRepo _repo;

  TextEditingController reviewController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double rate = 0;


  void updateRatingField(double p1) {
    rate = p1;
    emit(UpdateRatingField(rate));
  }

  List<ReviewEntity> reviews = [];

  Future<void> addReview(
      ReviewEntity review,
      String productId,
      ) async
  {
    emit(AddReviewLoading());

    final result = await _repo.addReview(
      review,
      productId,
    );

    result.fold(
          (failure) {
        print(failure.errMessage);
        emit(AddReviewError(failure.errMessage));
      },
          (_) async {
        await getReviews(productId);
        emit(AddReviewSuccess());
      },
    );
  }

  Future<void> getReviews(String productId) async {
    emit(GetReviewLoading());

    final result = await _repo.getReviews(productId);

    result.fold(
          (failure) {
        print(failure.errMessage);
        emit(GetReviewError(failure.errMessage));
      },
          (reviewsData) {
        reviews = reviewsData;
        emit(GetReviewSuccess());
      },
    );
  }
}
