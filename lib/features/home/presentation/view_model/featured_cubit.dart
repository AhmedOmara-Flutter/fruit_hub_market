import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/repos/product_repo.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit(this._productRepo) : super(FeaturedInitial());
  final ProductRepo _productRepo;
  List<ProductEntity> featuredProducts = [];

  Future<void> getFeaturedProducts() async {
    emit(GetFeaturedProductsLoadingState());
    final products = await _productRepo.getProducts();
    products.fold(
      (failure) {
        emit(GetFeaturedProductsErrorState(errMessage: failure.errMessage));
      },
      (data) {
        featuredProducts = data
            .where((element) => element.isFeatured == true)
            .toList();
        emit(
          GetFeaturedProductsSuccessState(featuredProducts: featuredProducts),
        );
      },
    );
  }
}
