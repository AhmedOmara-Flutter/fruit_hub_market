import 'package:fruit_hub_market/core/utils/app_imports.dart';
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
