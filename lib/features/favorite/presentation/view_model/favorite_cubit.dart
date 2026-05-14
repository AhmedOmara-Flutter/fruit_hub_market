import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/favorite/domain/repos/favorite_repo.dart';
import 'package:meta/meta.dart';

import '../../../product/domain/entities/product_entity.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo _favoriteRepo;

  Future toggleFavorite(ProductEntity product) async {
    final data = await _favoriteRepo.toggleFavorite(product);
    data.fold(
      (l) {
        print(l);
        emit(FavoriteToggledErrorState(errMessage: l));
      },
      (r) async {
        await getFavorites();
      },
    );
  }

  Future<void> getFavorites() async {
    emit(GetFavoriteLoadingState());
    try {
      final result = await _favoriteRepo.getFavoriteProducts();
      result.fold(
        (l) {
          log(l);
          emit(GetFavoriteErrorState(error: l));
        },
        (favoritesProducts) {
          if (favoritesProducts.isEmpty) {
            emit(GetFavoriteEmptyState());
            return;
          }
          emit(GetFavoriteSuccessState(favoritesProducts));
        },
      );
    } catch (e) {
      log(e.toString());
      emit(GetFavoriteErrorState(error: e.toString()));
    }
  }
}
