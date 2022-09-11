import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';

class AppTheme {
  // ignore: long-method
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      platform: TargetPlatform.android,
      scaffoldBackgroundColor: Colors.amber,
      primaryColor: Colors.amber,
      canvasColor: Colors.amber,
      textTheme: GoogleFonts.latoTextTheme(),
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
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }
}
