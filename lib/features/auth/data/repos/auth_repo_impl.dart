import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    RegisterRequest registerRequest,
  ) async {
    try {
      final user = await authRemoteDataSource.createUserWithEmailAndPassword(
        registerRequest,
      );
      return Right(
        UserEntity(
          userName: user.displayName ?? '',
          email: user.email ?? '',
          uId: user.uid,
        ),
      );
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    LoginRequest loginRequest,
  ) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
