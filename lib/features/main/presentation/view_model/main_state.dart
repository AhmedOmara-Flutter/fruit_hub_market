part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class GetProfileDataLoadingState extends MainState {}

final class GetProfileDataSuccessState extends MainState {
  final UserEntity userEntity;

  GetProfileDataSuccessState({required this.userEntity});
}

final class GetProfileDataErrorState extends MainState {
  final String error;

  GetProfileDataErrorState({required this.error});
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
