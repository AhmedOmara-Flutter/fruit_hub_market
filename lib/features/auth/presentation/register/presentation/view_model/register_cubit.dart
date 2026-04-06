import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_market/features/auth/data/requests/auth_request.dart';
import 'package:fruit_hub_market/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());
  final AuthRepo _authRepo;

  Future<void> createAccount({
    required String email,
    required String password,
    required String userName,
    required String uId,
  }) async {
    emit(CreateAccountLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set({'email': email, 'password': password, 'userName': userName})
        .then((value) {
          emit(CreateAccountSuccess());
        })
        .catchError((error) {
          print(error.toString());
          emit(CreateAccountError(error.toString()));
        });
  }

  Future<void> register({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(RegisterLoading());
    final data = await _authRepo.createUserWithEmailAndPassword(
      RegisterRequest(email: email, password: password),
    );
    data.fold(
      (failure) {
        emit(RegisterError(failure.errMessage));
      },
      (data) {
        createAccount(
          email: email,
          password: password,
          userName: userName,
          uId: data.uId,
        );

        emit(RegisterSuccess());
      },
    );
  }
}
