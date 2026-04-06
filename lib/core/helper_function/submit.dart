import '../services/cache_helper.dart';

void submit() async {
  await CacheHelper.saveData(key: 'onBoarding', value: true);
}
