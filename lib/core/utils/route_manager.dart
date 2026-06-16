import 'package:fruit_hub_market/core/entities/order_entity.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/widgets/best_selling_more_view.dart';
import 'package:fruit_hub_market/features/profile/presentation/view/edit_profile_view.dart';

import '../../features/cart/domain/entities/cart_entity.dart';
import '../../features/checkout/presentation/view/checkout_view.dart';
import '../../features/checkout/presentation/view/order_tracking_view.dart';
import '../../features/checkout/presentation/view/payment_success_view.dart';
import '../../features/favorite/presentation/view/favorite_view.dart';
import '../../features/product_details/presentation/view/product_details_view.dart';
import '../../features/profile/presentation/view/orders_view.dart';
import '../../features/reviews/presentation/view/reviews_view.dart';
import '../../features/search/presentation/view/search_view.dart';
import '../entities/product_entity.dart';
import '../enums/order_enum.dart';

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
  static const String reviews = '/reviews';
  static const String checkout = '/checkout';
  static const String paymentSuccess = '/paymentSuccess';
  static const String orderTracking = '/orderTracking';
  static const String favorite = '/favorite';
  static const String orders = '/orders';
  static const String editProfile = '/editProfile';
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
        case RouteManager.editProfile:
        return MaterialPageRoute(builder: (context) {
          return EditProfileView();
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
          case RouteManager.reviews:
        return MaterialPageRoute(builder: (context) {
          final productId = settings.arguments as String;
          return ReviewsView(productId: productId);
        });
        case RouteManager.checkout:
          return MaterialPageRoute(builder: (context) {
            return CheckoutView(
                orderEntity: OrderEntity(
              cartEntity: settings.arguments as CartEntity,
              uId: getUser().uId,
                  userEntity: getUser(), status: OrderStatus.pending,
                )
            );
          });
      case RouteManager.paymentSuccess:
        return MaterialPageRoute(builder: (context) {
          final orderEntity = settings.arguments as OrderEntity;
          return PaymentSuccessView(orderEntity: orderEntity,);
        });
        case RouteManager.orderTracking:
          return MaterialPageRoute(builder: (context) {
            return OrderTrackingView();
          });
          case RouteManager.favorite:
            return MaterialPageRoute(builder: (context) {
              return FavoriteView();
            });
      case RouteManager.orders:
        return MaterialPageRoute(builder: (context) {
          return OrdersView();
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
