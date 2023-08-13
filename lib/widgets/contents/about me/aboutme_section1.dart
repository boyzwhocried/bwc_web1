import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/contents/about%20me/aboutme_section1_layouts.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_spin_widget.dart';
import 'package:flutter/material.dart';

class AboutMeSection1 extends StatelessWidget {
  const AboutMeSection1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: (7 / 100) * getScreenWidth(context)),
                child: AnimatedFadeInWidget(
                  startDelay: const Duration(milliseconds: 500),
                  child: AnimatedSpinWidget(
                    endRotationDegree: 420,
                    delayedStart: true,
                    delayDuration: const Duration(milliseconds: 500),
                    spinCurve: Curves.easeInOutCubic,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        height: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeInWidget(
                  slideDirection: SlideDirection.rightToLeft,
                  startDelay: const Duration(milliseconds: 200),
                  child: Text(
                    'about me',
                    style: TextStyle(
                        fontSize: responsiveFontSize(context, 80,
                            maxFontSize: 100, scalingFactor: 0.2),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: (1 / 100) * getScreenWidth(context),
                  ),
                  child: AnimatedFadeInWidget(
                    startDelay: const Duration(milliseconds: 200),
                    child: getScreenWidth(context) <= 701
                        ? const Layout1()
                        : getScreenWidth(context) <= 880
                            ? const Layout2()
                            : const Layout3(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
