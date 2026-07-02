import 'dart:async';

import 'package:fruit_hub_market/core/utils/app_imports.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  Timer? _timer;

  late AnimationController _controller;
  late Animation<Offset> logoSlide;
  late Animation<double> logoFade;
  late Animation<Offset> topSlide;
  late Animation<Offset> bottomSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    logoSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    logoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _controller.forward();
    goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.splashBackground.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: logoFade,
            child: SlideTransition(
              position: logoSlide,
              child: Image.asset(
                height: 300,
                width: double.infinity,
                Assets.images.splashLogo2.path,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToHome() {
    _timer = Timer(const Duration(seconds: 3), () {
      if (!Constants.onBoarding) {
        Navigator.pushReplacementNamed(
          context,
          RouteManager.onBoarding,
        );
      } else {
        var isLogged = isLoggedIn();

        if (isLogged) {
          Navigator.pushReplacementNamed(
            context,
            RouteManager.home,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            RouteManager.login,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}