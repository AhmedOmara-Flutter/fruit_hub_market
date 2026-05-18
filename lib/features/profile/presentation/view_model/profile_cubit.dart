import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub_market/features/profile/domain/repos/profile_repo.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo, this._authRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;
  bool obscureText = true;

  void changeObscureText() {
    obscureText = !obscureText;
    emit(ProfileChangeObscureText());
  }

  Future<void> getOrders() async {
    emit(ProfileGetOrdersLoading());
    final result = await _profileRepo.getOrder(getUser().uId);
    result.fold(
      (failure) => emit(ProfileGetOrdersError(errMessage: failure.errMessage)),
      (data) {
        emit(ProfileGetOrdersSuccess(data));
      },
    );
  }

  Future<void> deleteAccount(String password) async {
    emit(ProfileDeleteAccountLoading());
    final result = await _authRepo.deleteAccount(password);
    result.fold(
      (failure) => emit(ProfileDeleteAccountError(errMessage: failure.errMessage)),
      (data) {
        emit(ProfileDeleteAccountSuccess());
      },
    );
  }
  void resetState() {
    emit(ProfileInitial());
  }

  void clearError() {
    if (state is ProfileDeleteAccountError) {
      emit(ProfileInitial());
    }
  }

}
