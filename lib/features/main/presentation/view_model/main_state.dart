part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class ChangeBottomNavState extends MainState {}

final class GetSellingProductsLoadingState extends MainState {}

final class GetSellingProductsSuccessState extends MainState {
  final List<ProductEntity> sellingProducts;

  GetSellingProductsSuccessState({required this.sellingProducts});
}

final class GetSellingProductsErrorState extends MainState {
  final String errMessage;

  GetSellingProductsErrorState({required this.errMessage});
}

final class GetProductsLoadingState extends MainState {}

final class GetProductsErrorState extends MainState {
  final String errMessage;

  GetProductsErrorState({required this.errMessage});
}

final class GetProductsSuccessState extends MainState {
  final List<ProductEntity> products;

  GetProductsSuccessState({required this.products});
}

