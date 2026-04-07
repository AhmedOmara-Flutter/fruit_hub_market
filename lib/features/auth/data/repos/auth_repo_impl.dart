import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    RegisterRequest registerRequest,
  ) async {
    try {
      final user = await _authRemoteDataSource.createUserWithEmailAndPassword(
        registerRequest,
      );
      return Right(
        UserModel.fromJson(user)
      );
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    LoginRequest loginRequest,) async {
    try {
      final user = await _authRemoteDataSource.signInWithEmailAndPassword(
        loginRequest,
      );
      return Right(
          UserModel.fromJson(user)
      );
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }


  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async{
    try {
      final user = await _authRemoteDataSource.signInWithGoogle();
      return Right(
          UserModel.fromJson(user)
      );
    } on GoogleSignInException  catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return Left(ServerFailure(errMessage: 'تم إلغاء تسجيل الدخول من قبل المستخدم'));
      } else {
        return Left(ServerFailure(errMessage: 'حدث خطأ أثناء تسجيل الدخول'));
      }
    }
  }
}
