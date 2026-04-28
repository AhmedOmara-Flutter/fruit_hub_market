import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/repos/product_repo.dart';

part 'best_selling_state.dart';

class BestSellingCubit extends Cubit<BestSellingState> {
  BestSellingCubit(this._productRepo) : super(BestSellingInitial());
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
