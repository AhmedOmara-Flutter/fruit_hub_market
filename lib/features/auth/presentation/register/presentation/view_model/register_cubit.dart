import 'dart:io';

import 'package:fruit_hub_market/core/utils/app_imports.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());
  final AuthRepo _authRepo;

  Future<void> register({
    required String email,
    required String password,
    required String userName,
    required File imageFile,
  }) async {
    emit(RegisterLoading());
    final data = await _authRepo.createUserWithEmailAndPassword(
      RegisterRequest(email: email, password: password, userName: userName, imageFile: imageFile),
    );
    data.fold(
      (failure) {
        emit(RegisterError(failure.errMessage));
      },
      (data) {
        emit(RegisterSuccess());
      },
    );
  }
}
