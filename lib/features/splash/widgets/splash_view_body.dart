import 'dart:async';

import 'package:fruit_hub_market/core/utils/app_imports.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Timer ?_timer;

  @override
  void initState() {
    goToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.images.splashTop.path)],
        ),
        SvgPicture.asset(Assets.images.splashCenter.path),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(Assets.images.splashBottom.path,),
          ],
        ),
      ],
    );
  }

  void goToHome() {
    _timer = Timer(const Duration(seconds: 3),
            () {
              if (!Constants.onBoarding) {
                Navigator.pushReplacementNamed(
                    context, RouteManager.onBoarding);
              }
              else if (Constants.uId.isNotEmpty) {
                Navigator.pushReplacementNamed(context, RouteManager.home);
              }
              else {
                Navigator.pushReplacementNamed(context, RouteManager.login);
              }
            }
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
