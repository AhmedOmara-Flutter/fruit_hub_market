part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ReviewsLoaded extends ProductDetailsState {}
final class ReviewError extends ProductDetailsState {
  final String errMessage;

  ReviewError(this.errMessage);
}
