import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/route_manager.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset('assets/images/splash_top.svg')],
        ),
        SvgPicture.asset('assets/images/splash_center.svg'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset('assets/images/splash_bottom.svg',),
          ],
        ),
      ],
    );
  }


  void goToHome() {
    _timer = Timer(const Duration(seconds: 3),
            () {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteManager.onBoarding, (route) => false);
        });
  }
}
