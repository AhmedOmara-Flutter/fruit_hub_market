import 'package:fruit_hub_market/core/services/cache_helper.dart';

class Utils {
  static void submit() async {
    await CacheHelper.saveData(key: 'onBoarding', value: true);
  }
}
