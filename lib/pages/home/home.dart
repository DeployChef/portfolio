import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/components/carousel.dart';
import 'package:portfolio/pages/home/components/cv_section.dart';
import 'package:portfolio/pages/home/components/footer.dart';
import 'package:portfolio/pages/home/components/header.dart';
import 'package:portfolio/pages/home/components/projects_ad.dart';
import 'package:portfolio/pages/home/components/stats.dart';
import 'package:portfolio/pages/home/components/upnova_ad.dart';
import 'package:portfolio/pages/home/components/work_with.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return headerItems[index].isButton
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDangerColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: headerItems[index].onTap,
                              child: Text(
                                headerItems[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : ListTile(
                          title: Text(
                            headerItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: headerItems[index].onTap,
                        );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: headerItems.length),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              Carousel(),
              SizedBox(height: 70),
              Stats(),
              SizedBox(height: 70),
              CvSection(),
              ProjectsAd(),
              SizedBox(height: 70),
              UpnovaAd(),
              SizedBox(height: 70),
              WorkWith(),
              SizedBox(height: 70),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
