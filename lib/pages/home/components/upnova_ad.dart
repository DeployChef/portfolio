import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpnovaAd extends StatelessWidget {
  const UpnovaAd({Key? key}) : super(key: key);
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
    var theme = Theme.of(context);
    Color color = theme.primaryColor;
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
                constraints.maxWidth > 720 ? _buildDescription(constraints, theme) : _buildPicture(constraints, darkModeOn),
                constraints.maxWidth > 720 ? _buildPicture(constraints, darkModeOn) : _buildDescription(constraints, theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildPicture(BoxConstraints constraints, bool darkModeOn) {
    return Expanded(
      flex: constraints.maxWidth > 720 ? 1 : 0,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              darkModeOn ? "assets/shresh1_dark.png" : "assets/shresh1_light.png",
              width: constraints.maxWidth > 720 ? null : 350,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  "assets/upnova.png",
                  width: constraints.maxWidth > 720 ? 400 : 250,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildDescription(BoxConstraints constraints, ThemeData theme) {
    return Expanded(
      flex: constraints.maxWidth > 720 ? 1 : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UPNOVA",
            style: GoogleFonts.oswald(color: kPrimaryColor, fontWeight: FontWeight.w900, fontSize: 16),
          ),
          SizedBox(height: 15),
          Text(
            "UPNOVA TEAM\nDEVELOPING UPDATERS",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Developing studio founder.\nCreating great designs and developing multifunctionals launchers/updaters for any games and applications.\nMore than 200+ updaters have already been developed.",
            style: TextStyle(
              color: kCaptionColor,
              height: 1.5,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 48,
                  width: 150,
                  child: TextButton(
                    onPressed: () async {
                      await launchUrlString('https://upnova.ru/');
                    },
                    child: Text(
                      "EXPLORE MORE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 10),
              // MouseRegion(
              //   cursor: SystemMouseCursors.click,
              //   child: Container(
              //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kPrimaryColor)),
              //     height: 48,
              //     width: 120,
              //     child: TextButton(
              //       onPressed: () {},
              //       child: Text(
              //         "NEXT APP",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 13,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
