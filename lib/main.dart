import 'package:fruit_hub_market/core/utils/app_imports.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  Bloc.observer = BlocObserverReader();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  Constants.onBoarding =await CacheHelper.getData(key: 'onBoarding')??false;
  Constants.login =await CacheHelper.getData(key: 'login')??false;
  Constants.uId = await CacheHelper.getData(key: 'uId') ?? '';


  print(Constants.onBoarding);
  print(Constants.login);
  runApp(MyApp());
}

