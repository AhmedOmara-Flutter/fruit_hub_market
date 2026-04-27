part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetSellingProductsLoadingState extends HomeState {}

final class GetSellingProductsSuccessState extends HomeState {
  final List<ProductEntity> sellingProducts;

  GetSellingProductsSuccessState({required this.sellingProducts});
}

final class GetSellingProductsErrorState extends HomeState {
  final String errMessage;

  GetSellingProductsErrorState({required this.errMessage});
}
