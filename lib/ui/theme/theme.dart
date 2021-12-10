import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class MyTheme {
  static ThemeData get ligthTheme {
    return ThemeData(
      primarySwatch: AppColors.createMaterialColor(AppColors.primaryColor),
      colorScheme: AppColors.lightScheme,
      fontFamily: AppTextStyle.fontFamily,
      textTheme: AppTextStyle.textTheme,
      appBarTheme: const AppBarTheme(elevation: 4),
      cardTheme: const CardTheme(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.shade500,
        selectedItemColor: AppColors.lightScheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        fillColor: Colors.grey.shade300,
      ),
    );
  }

  // on DarkMode the Swatch parameter is not working
  // https://github.com/flutter/flutter/issues/19089
  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: AppColors.createMaterialColor(AppColors.primaryColor),
      colorScheme: AppColors.darkScheme,
      toggleableActiveColor: AppColors.darkScheme.secondary,
      appBarTheme: const AppBarTheme(elevation: 1.0),
      // this can all be copied, waiting for verification
      fontFamily: AppTextStyle.fontFamily,
      cardTheme: const CardTheme(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
      ),

      textTheme: AppTextStyle.textTheme.copyWith(
        bodyText1: AppTextStyle.bodytext1.copyWith(
          color: Colors.white70,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: AppColors.darkScheme.primary,
      ),
      // copy from ligthTheme
      inputDecorationTheme: ligthTheme.inputDecorationTheme,
    );
  }
}
