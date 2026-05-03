import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/product/domain/repos/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../product/domain/entities/product_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._productRepo) : super(SearchInitial());
  final ProductRepo _productRepo;
  Timer? _debounce;

  Future<void> search(String query) async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async{
      if (query.trim().isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());
      try {
        final result = await _productRepo.searchProducts(query);
        result.fold((failure) => emit(SearchError(failure.errMessage)), (
          products,
        ) {
          if (products.isEmpty) {
            emit(SearchEmpty(query));
          } else {
            emit(SearchSuccess(products));
          }
        });
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
