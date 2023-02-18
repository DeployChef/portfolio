import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';

class AppTheme {
  // ignore: long-method
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      primaryColor: kBackgroundColor,
      accentColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColor2,
      colorScheme: const ColorScheme.light(
        secondary: Colors.lightBlue,
        // on light theme surface = Colors.white by default
        shadow: Colors.grey,
        inversePrimary: Colors.black,
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: kBodyTextColorLight),
      accentIconTheme: IconThemeData(color: kAccentIconLightColor),
      primaryIconTheme: IconThemeData(color: Colors.blue),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: const TextStyle(color: kBodyTextColorLight),
        bodyText2: const TextStyle(color: kBodyTextColorLight),
        headline4: const TextStyle(color: kBodyTextColorLight, fontSize: 32),
        headline1: const TextStyle(color: Colors.blue, fontSize: 80),
      ),
    );
  }

  // ignore: long-method
  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      primaryColor: kPrimaryColor,
      accentColor: kDangerColor,
      scaffoldBackgroundColor: kBackgroundDarkColor,
      colorScheme: ColorScheme.light(
        secondary: Colors.red,
        surface: kSurfaceDarkColor,
        shadow: Colors.black,
        inversePrimary: Colors.white,
      ),
      backgroundColor: kBackgroundDarkColor,
      iconTheme: const IconThemeData(color: kBodyTextColorDark),
      accentIconTheme: IconThemeData(color: kAccentIconDarkColor),
      primaryIconTheme: IconThemeData(color: Colors.white),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: const TextStyle(color: kBodyTextColorLight),
        bodyText2: const TextStyle(color: kBodyTextColorLight),
        headline4: const TextStyle(color: kBodyTextColorLight, fontSize: 32),
        headline1: const TextStyle(color: Colors.blue, fontSize: 80),
      ),
    );
  }
}
