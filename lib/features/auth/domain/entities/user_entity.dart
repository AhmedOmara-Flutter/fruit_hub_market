class UserEntity {
  final String userName;
  final String email;
  final String uId;

  UserEntity({required this.userName, required this.email, required this.uId});


  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
    };
  }
}