import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/services/storage_services.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices _authServices;
  final DatabaseServices _databaseServices;
  final StorageServices _storageServices;


  AuthRepoImpl(this._authServices, this._databaseServices,
      this._storageServices);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      RegisterRequest registerRequest) async {
    User ?user;
    try {
      final compressedImage = await _storageServices.compressedImage(
          registerRequest.imageFile);
      final imageUrl = await _storageServices.uploadImage(
        compressedImage,
        'profileImage',
      );

      //1- create auth first
      user = await _authServices.createUserWithEmailAndPassword(
        registerRequest,
      );

      // 2- create temporary user
      UserEntity userEntity = UserEntity(
        userName: registerRequest.userName,
        email: registerRequest.email,
        uId: user.uid,
        image: imageUrl,
        phone: registerRequest.phone,
      );

      // 3- save user مباشرة
      await addData(userEntity);


      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await _authServices.deleteUser();
      }
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    } catch (e) {
      if (user != null) {
        await _authServices.deleteUser();
      }
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      LoginRequest loginRequest) async {
    try {
      final user = await _authServices.signInWithEmailAndPassword(
        loginRequest,
      );
      final data = await getUserData(uId: user.uid);
      await saveUserData(data);
      return Right(
          data
      );
    } on Exception catch (e) {
      print(e);
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await _authServices.signInWithGoogle();
      return Right(
          UserModel.fromFirebaseUser(user)
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return Left(
            ServerFailure(errMessage: 'تم إلغاء تسجيل الدخول من قبل المستخدم'));
      } else {
        return Left(ServerFailure(errMessage: 'حدث خطأ أثناء تسجيل الدخول'));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await _authServices.signInWithFacebook();
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
    await _databaseServices.addData
      (
      path: 'users',
      data: UserModel.fromEntity(user).toJson(),
      uId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var user = await _databaseServices.getData(path: 'users', uId: uId);
    return UserModel.fromJson(user);
  }

  @override
  Future saveUserData(UserEntity user) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toJson());
    return await CacheHelper.saveData(key: 'userData', value: jsonData);
  }


  @override
  Future<Either<Failure, void>> deleteAccount(String password) async {
    try {

      await _databaseServices.reAuthenticate(
        email: getUser().email,
        password: password,
      );
      await _databaseServices.deleteData(
        path: 'users',
        uId: getUser().uId,
      );
      await _authServices.deleteUser();
      await CacheHelper.removeData(key: 'uId');
      await CacheHelper.removeData(key: 'userData');
      await CacheHelper.removeData(key: 'onBoarding');



      return right(null);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException in delete account is $e');
      return left(ServerFailure(errMessage: 'كلمه السر غير صحيحه'));
    } catch (e) {
      print('Exception in delete account is $e');
      return left(ServerFailure(errMessage: e.toString(),));
    }
  }

  @override
  Future<void> signOut() async {
    await _authServices.signOut();
    await CacheHelper.removeData(key: 'uId');
    await CacheHelper.removeData(key: 'userData');
  }
}
