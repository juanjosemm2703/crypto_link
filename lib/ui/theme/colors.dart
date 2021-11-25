import 'package:flutter/material.dart';

class AppColors {
  // Static color constants
  static const Color primaryColor = Color(0xFF4692EC);
  static const Color darkPrimaryColor = Color(0xFFBB86FC);
  static const Color primaryVariantColor = Color(0xFF4692EC);
  static const Color darkPrimaryVariantColor = Color(0xFF3700B3);
  static const Color secondaryColor = Color(0xFF4692EC);
  static const Color darkSecondaryColor = Color(0xFF03DAC6);

  static const Color lightBackground = Color(0xFFE9EBF5);
  static const Color darkBackground = Color(0xFF000000);

  static const Color textPrimaryColor = Color(0xFF000000);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color accentColorDarkTheme = Color(0xFF000000);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static ColorScheme lightScheme = const ColorScheme.light(
    primary: primaryColor,
    background: lightBackground,
    primaryVariant: primaryVariantColor,
    secondary: secondaryColor,
  );

  static ColorScheme darkScheme = const ColorScheme.dark(
    primary: darkPrimaryColor,
    primaryVariant: darkPrimaryVariantColor,
    background: darkBackground,
    secondary: darkSecondaryColor,
  );
}
