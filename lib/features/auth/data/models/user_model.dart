import 'package:fruit_hub_market/core/utils/app_imports.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.uId,
    required super.image,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userName: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      image: user.photoURL ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      uId: json['uId'],
      image: json['image'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      userName: user.userName,
      email: user.email,
      uId: user.uId,
      image: user.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
      'image': image,
    };
  }
}
