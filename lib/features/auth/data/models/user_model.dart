import 'package:fruit_hub_market/core/utils/app_imports.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.uId,
    required super.image,
    required super.phone,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userName: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      image: user.photoURL ?? '', phone: user.phoneNumber ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      uId: json['uId'],
      image: json['image'], phone: json['phone'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      userName: user.userName,
      email: user.email,
      uId: user.uId,
      image: user.image,
      phone: user.phone,
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      userName: userName,
      email: email,
      uId: uId,
      image: image,
      phone: phone,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
      'image': image,
      'phone': phone,
    };
  }
}


