import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/header_item.dart';
import 'package:portfolio/utils/constants.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: "HOME"),
  HeaderItem(title: "MY INTRO"),
  HeaderItem(title: "SERVICES"),
  HeaderItem(title: "PORTFOLIO"),
  HeaderItem(title: "TESTIMONIALS"),
  HeaderItem(title: "BLOGS"),
  HeaderItem(title: "HIRE ME"),
  HeaderItem(
    title: "HIRE ME",
    isButton: true,
    onTap: () {},
  ),
];

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
        ],
      ),
    );
  }
}
