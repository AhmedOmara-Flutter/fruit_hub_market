part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAdded extends CartState {}

final class CartRemoved extends CartState {}
final class CartUpdated extends CartState {}
