part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class UpdateRatingField extends ReviewState {
  final double rate;
  UpdateRatingField(this.rate);
}

final class AddReviewLoading extends ReviewState {}

final class AddReviewSuccess extends ReviewState {}

final class AddReviewError extends ReviewState {
  final String errMessage;

  AddReviewError(this.errMessage);
}

