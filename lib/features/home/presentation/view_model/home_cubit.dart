import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hub_market/features/home/domain/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;

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
