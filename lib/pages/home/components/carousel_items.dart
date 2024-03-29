import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/carousel_item_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

List<CarouselItemModel> getCarouselItems(ThemeData theme) => [
      CarouselItemModel(
        text: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "C# .Net / Flutter Developer",
                style: GoogleFonts.oswald(
                  color: theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 18),
              Text(
                "VLADISLAV\nTITOV",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 10),
              Text("Full stack developer, based on Moscow", style: theme.textTheme.bodyText2),
              SizedBox(height: 10),
              Container(
                child: Wrap(
                  children: [
                    Text(
                      "Need a full custom solution?",
                      style: theme.textTheme.bodyText2?.copyWith(
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launchUrlString('https://t.me/devchef');
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          " Got a project? Lets talk.",
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              // MouseRegion(
              //   cursor: SystemMouseCursors.click,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: kPrimaryColor,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     height: 48,
              //     child: TextButton(
              //       onPressed: () {},
              //       child: Text(
              //         "GET STARTED",
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
          ),
        ),
        image: Container(
          child: Image.asset(
            "assets/person2.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    ];
