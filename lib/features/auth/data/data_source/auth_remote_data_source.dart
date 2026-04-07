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
        throw CustomException('كلمة المرور يجب ألا تقل عن 6 أحرف');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل');
      }
      else if (e.code == 'network-request-failed') {
        throw CustomException('لا يوجد اتصال بالإنترنت، تأكد من الشبكة');
      } else {
        print(e.code);
        throw CustomException('حدث خطأ غير متوقع، حاول مرة أخرى');
      }
    } catch (e) {
      print(e);
      throw CustomException('حدث خطأ غير متوقع، حاول مرة أخرى');
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(LoginRequest loginRequest) async{
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      }
      else if (e.code == 'network-request-failed') {
        throw CustomException('لا يوجد اتصال بالإنترنت');
      } else {
        print(e.code);
        throw CustomException('حدث خطأ غير متوقع');
      }
    } catch (e) {
      print(e);
      throw CustomException('حدث خطأ غير متوقع');
    }
  }
}
