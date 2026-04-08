import 'package:fruit_hub_market/core/utils/app_imports.dart';

void loginViewed() async {
  await CacheHelper.saveData(key: 'login', value: true);
}
