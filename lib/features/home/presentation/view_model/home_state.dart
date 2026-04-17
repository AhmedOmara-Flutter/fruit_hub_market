part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProfileDataLoadingState extends HomeState {}

final class GetProfileDataSuccessState extends HomeState {
  final UserEntity userEntity;

  GetProfileDataSuccessState({required this.userEntity});
}

final class GetProfileDataErrorState extends HomeState {
  final String error;

  GetProfileDataErrorState({required this.error});
}

final class GetProductsLoadingState extends HomeState {}

final class GetProductsErrorState extends HomeState {
  final String errMessage;

  GetProductsErrorState({required this.errMessage});
}

final class GetProductsSuccessState extends HomeState {
  final List<ProductEntity> products;

  GetProductsSuccessState({required this.products});
}
