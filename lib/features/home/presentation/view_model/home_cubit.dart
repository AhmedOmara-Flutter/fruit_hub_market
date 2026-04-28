import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';
import 'package:fruit_hub_market/features/product/domain/repos/product_repo.dart';

import '../../../../core/utils/app_imports.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._productRepo) : super(HomeInitial());
  final ProductRepo _productRepo;
  List<ProductEntity> sellingProducts = [];

  Future<void> getSellingProducts() async {
    emit(GetSellingProductsLoadingState());
    final products = await _productRepo.getSellingProducts();
    products.fold(
      (failure) {
        emit(GetSellingProductsErrorState(errMessage: failure.errMessage));
      },
      (data) {
        sellingProducts = data;
        emit(GetSellingProductsSuccessState(sellingProducts: data));
      },
    );
  }
}
