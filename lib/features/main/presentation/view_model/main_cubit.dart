import 'package:fruit_hub_market/core/utils/app_imports.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._homeRepo) : super(MainInitial());
  final MainRepo _homeRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    final products = await _homeRepo.getProducts();
    products.fold((failure) {
      emit(GetProductsErrorState(errMessage: failure.errMessage));
    }, (data) {
      emit(GetProductsSuccessState(products: data));
    });
  }
}
