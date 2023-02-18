import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/models/header_item.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: "HOME", onTap: () {}),
  // HeaderItem(title: "MY INTRO", onTap: () {}),
  // HeaderItem(title: "SERVICES", onTap: () {}),
  // HeaderItem(title: "PORTFOLIO", onTap: () {}),
  //HeaderItem(title: "BLOGS", onTap: () {}),
  HeaderItem(
    title: "HIRE ME",
    isButton: true,
    onTap: () async {
      await launchUrlString('https://t.me/devchef');
    },
  ),
];

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map((item) => item.isButton
                ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.accentColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: item.onTap,
                        ),
                      ),
                    ),
                  )
                : MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: GestureDetector(
                        onTap: item.onTap,
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ))
            .toList(),
      ),
    );
  }
}

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: MouseRegion(
            child: GestureDetector(
              onTap: () {},
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "DC",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: ".",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
            ),
            cursor: SystemMouseCursors.click,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        DarkLightSwitch(),
      ],
    );
  }
}

class DarkLightSwitch extends StatefulWidget {
  DarkLightSwitch({Key? key}) : super(key: key);

  @override
  State<DarkLightSwitch> createState() => _DarkLightSwitchState();
}

class _DarkLightSwitchState extends State<DarkLightSwitch> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ValueNotifier<bool>>(
      builder: (context, darkTheme, child) => Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                darkTheme.value = !darkTheme.value;
                if (darkTheme.value) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: Lottie.asset(
                "assets/dark-light.json",
                repeat: false,
                height: 40,
                frameRate: FrameRate(100),
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  if (darkTheme.value) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: buildHeader(),
        ),
        tablet: buildHeader(),
        mobile: buildMobileHeader(),
      ),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [HeaderLogo(), HeaderRow()],
      ),
    );
  }
}
