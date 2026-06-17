import 'dart:async';

import 'package:fruit_hub_market/core/entities/product_entity.dart';
import 'package:fruit_hub_market/core/repos/product_repo/product_repo.dart';

import '../../../../core/utils/app_imports.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(ProductInitialState());
  final ProductRepo _productRepo;
  List<ProductEntity> filteredProducts = [];
  StreamSubscription? _productsSubscription;


  void getProducts() {
    _productsSubscription?.cancel();

    emit(GetProductsLoadingState());
    _productsSubscription= _productRepo.getProducts().listen((data) {
      data.fold(
            (failure) {
          emit(GetProductsErrorState(errMessage: failure.errMessage));
        },
            (data) {
          filteredProducts = data;

          emit(GetProductsSuccessState(products: data));
        },
      );
    });
  }

  Future<void> increaseSellingCount(String productId) async {
    final data = await _productRepo.increaseSellingCount(productId);
    data.fold((failure) {
      emit(IncreaseSellingCountErrorState(errMessage: failure.errMessage));
    }, (_) {});
  }

  Future<void> getFilteredProducts(String category) async {
    _productsSubscription?.cancel();
    emit(GetFilteredProductsLoading());
    _productsSubscription= _productRepo.getFilteredProducts(category).listen((data){
      data.fold(
            (failure) => emit(GetFilteredProductsError(failure.errMessage)),
            (data) {
          filteredProducts = data;
          if (filteredProducts.isEmpty) {
            emit(GetFilteredProductsEmpty());
          } else {
            emit(GetFilteredProductsSuccess());
          }
        },
      );
    });

  }

  @override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }
}
