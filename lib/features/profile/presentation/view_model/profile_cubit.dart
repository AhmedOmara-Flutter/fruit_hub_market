import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub_market/features/profile/domain/repos/profile_repo.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  Future<void> getOrders() async {
    emit(ProfileGetOrdersLoading());
    final result = await _profileRepo.getOrder();
    result.fold(
      (failure) => emit(ProfileGetOrdersError(errMessage: failure.errMessage)),
      (data) {
        emit(ProfileGetOrdersSuccess(data));
      },
    );
  }
}
