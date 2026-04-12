import 'dart:convert';

import 'package:fruit_hub_market/core/utils/app_imports.dart';

UserEntity getUser() {
  var data = CacheHelper.getData(key: 'userData');
  var jsonData = jsonDecode(data);
  var userEntity = UserModel.fromJson(jsonData);
  return userEntity;
}
