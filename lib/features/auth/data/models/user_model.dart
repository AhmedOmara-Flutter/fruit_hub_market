import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.uId,
  });

  factory UserModel.fromJson(User user) {
    return UserModel(
      userName: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }
}
