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
    print('Loading...');

    emit(GetSellingProductsLoadingState());

    final products = await _productRepo.getSellingProducts();
    print('Result received');

    products.fold(
          (failure) {
            print('Error: ${failure.errMessage}');

            emit(GetSellingProductsErrorState(errMessage: failure.errMessage));
      },
          (data) {
            print('Products count: ${data.length}');

            if(data.isEmpty){
              print('Empty State');

              emit(GetSellingProductsEmptyState());
              return;
            }
        sellingProducts = data;
        emit(GetSellingProductsSuccessState(sellingProducts: data));
      },
    );
  }

}
