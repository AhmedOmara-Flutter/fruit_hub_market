part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileUploadImageLoading extends ProfileState {}

final class ProfileUploadImageSuccess extends ProfileState {
  final String image;

  ProfileUploadImageSuccess({required this.image});
}

final class ProfileUploadImageError extends ProfileState {
  final String errMessage;

  ProfileUploadImageError({required this.errMessage});
}

final class ProfileGetOrdersLoading extends ProfileState {}

final class ProfileGetOrdersSuccess extends ProfileState {
  final List<OrderEntity> orders;

  ProfileGetOrdersSuccess(this.orders);
}

final class ProfileGetOrdersError extends ProfileState {
  final String errMessage;

  ProfileGetOrdersError({required this.errMessage});
}
