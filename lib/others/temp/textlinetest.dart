import 'package:bwc_web1/utils/lorem_ipsum_generator.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_spin_widget.dart';
import 'package:flutter/material.dart';

class AboutTest extends StatelessWidget {
  const AboutTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: OnTextLineChangesTest(
                text: 'about me',
                style: TextStyle(
                  fontSize: responsiveFontSize(context, 80,
                      maxFontSize: 100, scalingFactor: 0.2),
                  fontWeight: FontWeight.bold,
                ),
                updateCallback: (numLines) {
                  print(numLines.toString() + 'outside');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: (1 / 100) * getScreenWidth(context),
              ),
              child: Text(
                generateLoremIpsum(100),
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontSize: responsiveFontSize(context, 9)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OnTextLineChangesTest extends StatelessWidget {
  const OnTextLineChangesTest({
    super.key,
    required this.text,
    required this.updateCallback,
    required this.style,
  });

  final String text;
  final TextStyle style;
  final Function(int) updateCallback;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        String textContent = text;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final double textHeight = renderBox.size.height;
          final int numLinesRaw = ((textHeight / style.fontSize!).ceil()) - 1;
          int numLines = 0;
          // if (numLines > 1) {
          //   // textContent = "about me2";
          //   print(numLines);
          // } else {
          //   // textContent = "about me";
          // print(numLines);
          // }
          // print(numLines);
          if (numLines != numLinesRaw) {
            numLines = numLinesRaw;
            updateCallback(numLines);
          }
        });
        return Text(
          textContent,
          style: TextStyle(
            fontSize: responsiveFontSize(context, 80,
                maxFontSize: 100, scalingFactor: 0.2),
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
