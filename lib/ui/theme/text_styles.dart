import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static String? get fontFamily => GoogleFonts.openSans().fontFamily;
  //static String? get fontFamily => GoogleFonts.yanoneKaffeesatz().fontFamily;

  // Google font
  static TextStyle get defaultFontStyle => GoogleFonts.openSans();

  // if we need to change a style

  // Headline 1
  static TextStyle get headline1 => GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );
  // Headline 2
  static TextStyle get headline2 => GoogleFonts.lato(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );
  // Headline 3
  static TextStyle get headline3 => GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );
  // Bodytext 1
  static TextStyle get bodytext1 => GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );
  // Caption
  static TextStyle get caption => GoogleFonts.lato(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  static TextTheme get textTheme => TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        bodyText1: bodytext1,
        caption: caption,
      );
}
