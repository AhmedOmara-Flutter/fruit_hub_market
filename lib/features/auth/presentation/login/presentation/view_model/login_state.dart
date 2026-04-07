part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String errMessage;

  LoginError(this.errMessage);
}
final class SignInWithGoogleLoading extends LoginState {}
final class SignInWithGoogleSuccess extends LoginState {}

final class SignInWithGoogleError extends LoginState {
  final String errMessage;

  SignInWithGoogleError(this.errMessage);
}