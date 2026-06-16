import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruit_hub_market/core/services/notification_services.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  Bloc.observer = BlocObserverReader();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationServices.initLocal();
  await NotificationServices.initFirebase();


  await Supabase.initialize(
    url: 'https://wplubouwksawibitfhlj.supabase.co',
    anonKey: 'sb_publishable_28OdrvHF22OZhJIOnmQGFQ_T98mgadn',
  );

  await CacheHelper.init();
  Constants.onBoarding =await CacheHelper.getData(key: 'onBoarding')??false;
  Constants.uId = await CacheHelper.getData(key: 'uId') ?? '';

  runApp(MyApp());

}



