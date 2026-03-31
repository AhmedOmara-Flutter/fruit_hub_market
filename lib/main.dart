import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_market/core/utils/theme_manager.dart';

import 'core/utils/route_manager.dart';
import 'generated/l10n.dart';

void main() {
  MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
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
    );
  }
}
