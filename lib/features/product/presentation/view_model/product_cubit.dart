import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';
import 'package:fruit_hub_market/features/product/domain/repos/product_repo.dart';

import '../../../../core/utils/app_imports.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(HomeInitial());
  final ProductRepo _productRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    final products = await _productRepo.getProducts();
    products.fold(
      (failure) {
        emit(GetProductsErrorState(errMessage: failure.errMessage));
      },
      (data) {
        emit(GetProductsSuccessState(products: data));
      },
    );
  }
}
