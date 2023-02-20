import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<String> workWithLogos = [
  "assets/brand1.png",
  "assets/brand2.png",
  "assets/brand3.png",
  "assets/brand4.png",
  "assets/brand5.png",
  "assets/brand6.png",
];

class WorkWith extends StatelessWidget {
  const WorkWith({Key? key}) : super(key: key);
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
    return Center(
      child: Column(
        children: [
          Text(
            "I HAVE WORKED FOR",
            style: GoogleFonts.oswald(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          ResponsiveWrapper(
            minWidth: width,
            maxWidth: width,
            defaultScale: false,
            child: LayoutBuilder(
              builder: (_context, constraints) => Wrap(
                runSpacing: 20,
                spacing: 50,
                children: workWithLogos
                    .map((e) => Container(
                          height: 60,
                          child: Image.asset(e),
                          constraints: BoxConstraints(
                            maxWidth: ScreenHelper.isMobile(context) ? constraints.maxWidth / 3 - 50 : constraints.maxWidth / 6 - 50,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
