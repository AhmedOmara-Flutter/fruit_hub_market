import 'package:flutter/material.dart';

import 'core/utils/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        fontFamily: 'Cairo'
      ),
      onGenerateRoute: GenerateRoute.generateRoute,
      initialRoute: RouteManager.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
