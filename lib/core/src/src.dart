import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';
import '../utils/app_imports.dart';
import '../utils/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
