import 'package:bloc/bloc.dart';
import 'package:fruit_hub_market/features/auth/data/requests/auth_request.dart';
import 'package:fruit_hub_market/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final data = await _authRepo.signInWithEmailAndPassword(
      LoginRequest(email: email, password: password),
    );
    data.fold(
      (failure) {
        emit(LoginError(failure.errMessage));
      },
      (data) {
        emit(LoginSuccess());
      },
    );
  }
}
