import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_more_view.dart';
import 'package:fruit_hub_market/features/product_details/view/product_details_view.dart';

import '../../features/product/domain/entities/product_entity.dart';
import '../../features/search/presentation/view/search_view.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String home = '/main';
  static const String bestSellingMore = '/bestSellingMore';
  static const String productDetails = '/productDetails';
  static const String search = '/search';
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RouteManager.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteManager.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RouteManager.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RouteManager.home:
        return MaterialPageRoute(builder: (_) {
          return MainView();
        });
      case RouteManager.bestSellingMore:
        return MaterialPageRoute(builder: (context) {
          return BestSellingMoreView();
        });
        case RouteManager.productDetails:
          return MaterialPageRoute(builder: (context) {
            final product = settings.arguments as ProductEntity;

            return ProductDetailsView(
              product: product,
            );
          });

          case RouteManager.search:
        return MaterialPageRoute(builder: (context) {
          return SearchView();
        });


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text('Something went wrong!')),
        );
      },
    );
  }
}
