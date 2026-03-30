import 'package:flutter/material.dart';
import '../../features/onboarding_view/view/onboarding_view.dart';
import '../../features/splash/view/splash_view.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
        case RouteManager.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
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
