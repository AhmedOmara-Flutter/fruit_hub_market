import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final DatabaseRemoteDataSource _databaseRemoteDataSource;


  AuthRepoImpl(this._authRemoteDataSource, this._databaseRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    RegisterRequest registerRequest,
  ) async {
    User ?user;
    try {
      user = await _authRemoteDataSource.createUserWithEmailAndPassword(
        registerRequest,
      );
      UserEntity userEntity = UserEntity(
        userName: registerRequest.userName,
        email: registerRequest.email,
        uId: user.uid,
      );
      await addData(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await _authRemoteDataSource.deleteUser();
      }
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    } catch (e) {
      if (user != null) {
        await _authRemoteDataSource.deleteUser();
      }
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
          UserModel.fromFirebaseUser(user)
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
          UserModel.fromFirebaseUser(user)
      );
    } on GoogleSignInException  catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return Left(ServerFailure(errMessage: 'تم إلغاء تسجيل الدخول من قبل المستخدم'));
      } else {
        return Left(ServerFailure(errMessage: 'حدث خطأ أثناء تسجيل الدخول'));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await _authRemoteDataSource.signInWithFacebook();
      return Right(
          UserModel.fromFirebaseUser(user)
      );
    } catch (e) {
      // if (e.code == GoogleSignInExceptionCode.canceled) {
      //   return Left(ServerFailure(errMessage: 'تم إلغاء تسجيل الدخول من قبل المستخدم'));
      // } else {
      // return Left(ServerFailure(errMessage: 'حدث خطأ أثناء تسجيل الدخول'));
      return Left(ServerFailure(errMessage: e.toString()));
      //}
    }
  }

  @override
  Future<void> addData(UserEntity user) async {
    await _databaseRemoteDataSource.addData(path: 'users', data: user.toMap());
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var user = await _databaseRemoteDataSource.getData(path: 'users', uId: uId);
    return UserModel.fromJson(user);
  }
}
