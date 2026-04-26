import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../view/pages/cart/view/cart_view.dart';
import '../view/pages/products/view/products_view.dart';
import '../view/pages/profile/view/profile_view.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._mainRepo) : super(MainInitial());
  final MainRepo _mainRepo;
   int currentIndex=0;
   List<Widget>pages=[
     HomeView(),
     ProductsView(),
     CartView(),
     ProfileView(),
   ];
   void changeBottomNav(int index){
     currentIndex=index;
     emit(ChangeBottomNavState());
   }

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
