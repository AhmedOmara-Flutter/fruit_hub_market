import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/best_selling_cubit.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/featured_cubit.dart';
import 'package:fruit_hub_market/features/profile/presentation/view_model/profile_cubit.dart';

import '../../features/cart/presentation/view_model/cart_cubit.dart';
import '../../features/favorite/presentation/view_model/favorite_cubit.dart';
import '../../features/offers/presentation/view_model/offer_cubit.dart';
import '../../features/reviews/presentation/view_model/add_review_cubit/add_review_cubit.dart';
import '../../features/reviews/presentation/view_model/get_review_cubit/get_review_cubit.dart';
import '../cubit/product_cubit/product_cubit.dart';

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
          BlocProvider(create: (context) => CartCubit(),),
          BlocProvider(create: (context) => FavoriteCubit(instance())..getFavorites()),
          BlocProvider(create: (context) => ProfileCubit(instance(), instance())..getOrders(),),
          BlocProvider(create: (context) => AddReviewCubit(instance()),),
          BlocProvider(create: (context) => GetReviewCubit(instance()),),
          BlocProvider(create: (context) => OfferCubit(instance()),
          ),
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
