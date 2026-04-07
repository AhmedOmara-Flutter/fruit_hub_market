import 'package:fruit_hub_market/core/utils/app_imports.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  Bloc.observer = BlocObserverReader();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  Constants.onBoarding = CacheHelper.getData(key: 'onBoarding')??false;
  print(Constants.onBoarding);
  runApp(MyApp());
}

