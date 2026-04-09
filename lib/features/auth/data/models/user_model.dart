import 'package:fruit_hub_market/core/utils/app_imports.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.uId,
  });

//   هياخد user الي جاي من ال firebase وهيحوله model وخلي بالك خوا بيورث من userEntity يعني الuserEntity return
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userName: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      uId: json['uId'],
    );
  }
}
