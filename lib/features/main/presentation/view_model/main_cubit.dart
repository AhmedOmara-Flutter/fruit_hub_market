import 'package:fruit_hub_market/core/utils/app_imports.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._mainRepo) : super(MainInitial());
  final MainRepo _mainRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    final products = await _mainRepo.getProducts();
    products.fold((failure) {
      emit(GetProductsErrorState(errMessage: failure.errMessage));
    }, (data) {
      emit(GetProductsSuccessState(products: data));
    });
  }

  Future<void> getSellingProducts() async {
    emit(GetSellingProductsLoadingState());
    final products = await _mainRepo.getSellingProducts();
    products.fold((failure) {
      emit(GetSellingProductsErrorState(errMessage: failure.errMessage));
    }, (data) {
      emit(GetSellingProductsSuccessState(sellingProducts: data));
    });
  }
}
