import 'package:fruit_hub_market/core/utils/app_imports.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(

    ///elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff1B5E37),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(double.infinity, 60),
      ),
    ),

    ///text theme
    textTheme: TextTheme(
      titleLarge: StyleManager.font25Weight700,
      titleMedium: StyleManager.font15Weight600,
      titleSmall: StyleManager.font15Weight400,
        labelSmall: StyleManager.font18Weight700
    ),
  );
}
