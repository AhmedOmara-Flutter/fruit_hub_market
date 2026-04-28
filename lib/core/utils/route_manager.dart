import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_more_view.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String home = '/main';
  static const String bestSellingMore = '/bestSellingMore';
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
