import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';


abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(RegisterRequest registerRequest);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(LoginRequest loginRequest);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future<void> addData(UserEntity user);

  Future<UserEntity> getUserData({required String uId});

}
