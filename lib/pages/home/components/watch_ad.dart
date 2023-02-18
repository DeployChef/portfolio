import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home/components/analog_watch.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WatchAd extends StatelessWidget {
  const WatchAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, 1000),
        tablet: _buildUi(context, 760),
        mobile: _buildUi(context, MediaQuery.of(context).size.width * 0.8),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    Color color = Theme.of(context).primaryColor;
    bool darkModeOn = color.value == kPrimaryColor.value;
    return Center(
      child: LayoutBuilder(
        builder: (_context, constraints) => ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Container(
            child: Flex(
              direction: constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720 ? 1 : 0,
                  child: Container(
                    width: constraints.maxWidth > 720 ? null : 350,
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(child: AnalogWatch()),
                  ),
                ),
                Expanded(
                  flex: constraints.maxWidth > 720 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Analog Watch",
                        style: GoogleFonts.oswald(color: kPrimaryColor, fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "WATCH APP\nON FLUTTER",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Yes! This clock is also written in flutter and has two themes.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
