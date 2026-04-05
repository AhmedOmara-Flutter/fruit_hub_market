import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../../../../core/errors/exception.dart';


abstract class AuthRemoteDataSource {
  Future<User> createUserWithEmailAndPassword(RegisterRequest registerRequest);
  Future<User> signInWithEmailAndPassword(LoginRequest loginRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<User> createUserWithEmailAndPassword(
      RegisterRequest registerRequest,
      ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: registerRequest.email,
        password: registerRequest.password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else {
        throw CustomException(e.code);
      }
    } catch (e) {
      print(e);
      throw CustomException('Something went wrong');
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(LoginRequest loginRequest) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
