import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Stat {
  final String count;
  final String text;

  Stat(this.count, this.text);
}

final List<Stat> stats = [
  Stat("300+", "Projects"),
  Stat("178", "Clients"),
  Stat("${calcExperience()}+", "Years\nExperience"),
];

String calcExperience() {
  final DateTime dateFirst = DateTime(2016, 5, 00, 00, 00, 00);
  final now = DateTime.now();
  final Duration duration = now.difference(dateFirst);
  return (duration.inDays / 365).toStringAsFixed(0);
}

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);
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
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (p0, constraint) => Wrap(
            spacing: 20,
            runSpacing: 20,
            children: stats
                .map(
                  (stat) => Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    width: ScreenHelper.isMobile(context) ? constraint.maxWidth / 2 - 20 : constraint.maxWidth / 4 - 20,
                    child: Row(
                      children: [
                        Text(
                          stat.count,
                          style: GoogleFonts.oswald(
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          stat.text,
                          style: TextStyle(
                            fontSize: 20,
                            color: kCaptionColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
