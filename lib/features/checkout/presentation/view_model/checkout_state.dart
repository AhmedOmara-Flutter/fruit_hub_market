part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}
final class CheckoutChangePage extends CheckoutState {}
final class CheckoutSelectShipping extends CheckoutState {}
final class CheckoutOrderConfirmed extends CheckoutState {}
