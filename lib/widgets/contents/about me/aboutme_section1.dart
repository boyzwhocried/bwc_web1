import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
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

class Layout3 extends StatelessWidget {
  const Layout3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            Constants().aboutMeSection1Paragraph(),
            style: Constants().responsiveTextStyleContent(context),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: responsivePaddingSize(context, 2)),
          child: SizedBox(
            width: responsiveFontSize(
              context,
              100,
              maxFontSize: 140,
            ),
          ),
        ),
      ],
    );
  }
}

class Layout2 extends StatelessWidget {
  const Layout2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'me',
          style: TextStyle(
            fontSize: responsiveFontSize(context, 80,
                maxFontSize: 100, scalingFactor: 0.2),
            fontWeight: FontWeight.bold,
            color: Colors.transparent,
          ),
        ),
        Text(
          Constants().aboutMeSection1Paragraph(),
          style: Constants().responsiveTextStyleContent(context),
        ),
      ],
    );
  }
}

class Layout1 extends StatelessWidget {
  const Layout1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Constants().aboutMeSection1Paragraph(),
      style: Constants().responsiveTextStyleContent(context),
    );
  }
}
