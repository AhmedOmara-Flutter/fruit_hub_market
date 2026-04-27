import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/product_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._mainRepo) : super(HomeInitial());
  final MainRepo _mainRepo;


  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    final products = await _mainRepo.getProducts();
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
