import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/components/carousel_items.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Carousel extends StatelessWidget {
  final CarouselController carouselController = CarouselController();

  Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var carouselContainerHeight = MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context) ? .7 : .85);

    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              items: List.generate(
                carouselItems.length,
                (index) => Builder(
                  builder: (context) => Container(
                    constraints: BoxConstraints(minHeight: carouselContainerHeight),
                    child: ScreenHelper(
                      desktop: _buildDesktop(
                        context,
                        carouselItems[index].text,
                        carouselItems[index].image,
                      ),
                      tablet: _buildTablet(
                        context,
                        carouselItems[index].text,
                        carouselItems[index].image,
                      ),
                      mobile: _buildMobile(
                        context,
                        carouselItems[index].text,
                        carouselItems[index].image,
                      ),
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: 1000,
        minWidth: 1000,
        defaultScale: false,
        child: Row(
          children: [Expanded(child: text), Expanded(child: image)],
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context, Widget text, Widget image) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: 760,
        minWidth: 760,
        defaultScale: false,
        child: Row(
          children: [Expanded(child: text), Expanded(child: image)],
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context, Widget text, Widget image) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
      width: double.infinity,
      child: text,
    );
  }
}
