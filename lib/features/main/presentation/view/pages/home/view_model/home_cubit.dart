import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/main/domain/repos/main_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/product_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._mainRepo) : super(HomeInitial());
  final MainRepo _mainRepo;

  Future<void> getSellingProducts() async {
    emit(GetSellingProductsLoadingState());
    final products = await _mainRepo.getSellingProducts();
    products.fold(
      (failure) {
        emit(GetSellingProductsErrorState(errMessage: failure.errMessage));
      },
      (data) {
        emit(GetSellingProductsSuccessState(sellingProducts: data));
      },
    );
  }
}
