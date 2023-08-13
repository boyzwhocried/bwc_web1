import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/contents/about%20me/aboutme_section1.dart';
import 'package:bwc_web1/widgets/contents/about%20me/aboutme_section2.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (12 / 100) * getScreenWidth(context),
          vertical: (3 / 100) * getScreenWidth(context),
        ),
        child: const Column(
          children: [
            AboutMeSection1(),
            AnimatedFadeInWidget(
              child: AboutMeSection2(),
            ),
          ],
        ),
      ),
    );
  }
}
