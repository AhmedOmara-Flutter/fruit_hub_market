import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_market/core/services/cache_helper.dart';

import 'core/src/src.dart';
import 'core/utils/constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  Constants.onBoarding = CacheHelper.getData(key: 'onBoarding')??false;
  print(Constants.onBoarding);
  runApp(MyApp());
}

