import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';

class AppTheme {
  // ignore: long-method
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      platform: TargetPlatform.android,
      scaffoldBackgroundColor: kBackgroundColor2,
      primaryColor: kPrimaryColor2,
      canvasColor: kBackgroundColor2,
      accentColor: kDangerColor2,
      textTheme: GoogleFonts.latoTextTheme().copyWith(headline2: TextStyle(color: Colors.red)),
    );
  }

  // ignore: long-method
  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      platform: TargetPlatform.android,
      scaffoldBackgroundColor: kBackgroundColor,
      primaryColor: kPrimaryColor,
      canvasColor: kBackgroundColor,
      accentColor: kDangerColor,
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }
}
