import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/best_selling_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/featured_cubit.dart';
import '../../features/product/presentation/view_model/product_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainCubit(),),
          BlocProvider(create: (context) => BestSellingCubit(instance()),),
          BlocProvider(create: (context) => FeaturedCubit(instance()),),
          BlocProvider(create: (context) => ProductCubit(instance()),),
        ],
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale('ar'),
        theme: ThemeManager.lightTheme,
        onGenerateRoute: GenerateRoute.generateRoute,
        initialRoute: RouteManager.splash,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
