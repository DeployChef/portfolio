import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home/home.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _darkTheme = ValueNotifier<bool>(true);

    return ChangeNotifierProvider(
      create: (contex) => _darkTheme,
      child: Consumer<ValueNotifier<bool>>(
        builder: (context, value, child) => MaterialApp(
          title: 'Portfolio',
          debugShowCheckedModeBanner: false,
          theme: _darkTheme.value ? AppTheme.darkTheme : AppTheme.lightTheme,
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.resize(2460, name: "4k"),
            ],
            background: Container(
              color: kBackgroundColor,
            ),
          ),
          home: Home(),
        ),
      ),
    );
  }
}
