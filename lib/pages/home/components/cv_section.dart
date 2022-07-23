import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/develop_process.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<DevelopProcess> designProcesses = [
  DevelopProcess(
    title: "DEVELOPING",
    imagePath: "assets/design.png",
    subTitle:
        "A full stack allround developer A full stack allround A full stack allround A full stack allround",
  ),
  DevelopProcess(
    title: "DEVELOPING",
    imagePath: "assets/develop.png",
    subTitle:
        "A full stack allround B A full stack allround B A full stack allround B A full stack allround B",
  ),
  DevelopProcess(
    title: "DEVELOPING",
    imagePath: "assets/write.png",
    subTitle:
        "A full stack allround C A full stack allround A full stack allround A full stack allround",
  ),
  DevelopProcess(
    title: "DEVELOPING",
    imagePath: "assets/promote.png",
    subTitle:
        "A full stack allround D A full stack allround A full stack allround A full stack allround",
  ),
];

class CvSection extends StatelessWidget {
  const CvSection({Key? key}) : super(key: key);

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
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //_buildDownloadCv(),
          const SizedBox(height: 50),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) => ResponsiveGridView.builder(
                physics: NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                gridDelegate: ResponsiveGridDelegate(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                          ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 2
                      : 250,
                  childAspectRatio: ScreenHelper.isDesktop(context)
                      ? 1
                      : MediaQuery.of(context).size.aspectRatio * 1.5,
                ),
                itemCount: designProcesses.length,
                itemBuilder: (context, index) {
                  var item = designProcesses[index];
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.imagePath,
                              width: 40,
                            ),
                            SizedBox(width: 15),
                            Text(
                              item.title,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          item.subTitle,
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildDownloadCv() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "BETTER CODING,\nBETTER EXPERIENCES",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.8,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              "DOWNLOAD CV",
              style: GoogleFonts.oswald(
                color: kPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
