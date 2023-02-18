import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/gradient_icon.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Divider(
            thickness: 2,
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "That's all folks!\n",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.youtube,
                          color: Colors.red,
                        )),
                      ),
                      onTap: () async {
                        await launchUrlString('https://www.youtube.com/@deploychef');
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.telegram,
                          color: Color(0xff0088cc),
                        )),
                      ),
                      onTap: () async {
                        await launchUrlString('https://t.me/deploychef');
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: GradientIcon(
                          FontAwesomeIcons.instagram,
                          28,
                          LinearGradient(
                            colors: <Color>[
                              Color(0xff405de6),
                              Color(0xff833ab4),
                              Color(0xffe1306c),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )),
                      ),
                      onTap: () async {
                        await launchUrlString('https://www.instagram.com/deploychef/');
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.linkedinIn,
                          color: Color(0xff0088cc),
                        )),
                      ),
                      onTap: () async {
                        await launchUrlString('https://www.linkedin.com/in/vladislav-titov-7a68a517b/');
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        )),
                      ),
                      onTap: () async {
                        await launchUrlString('https://github.com/DeployChef');
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Follow me!\n",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
