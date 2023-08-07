import 'package:bwc_web1/utils/lorem_ipsum_generator.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/on_text_line_change.dart';
import 'package:flutter/material.dart';

class CustomAboutContent1 extends StatefulWidget {
  const CustomAboutContent1({
    super.key,
  });

  @override
  State<CustomAboutContent1> createState() => _AboutContentState();
}

class _AboutContentState extends State<CustomAboutContent1> {
  @override
  Widget build(BuildContext context) {
    bool? isSingleLine = getDeviceType(context) != DeviceType.phone;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedFadeInWidget(
          slideDirection: SlideDirection.rightToLeft,
          startDelay: const Duration(milliseconds: 200),
          child: OnTextLineChanges(
            text: 'about me',
            style: TextStyle(
                fontSize: responsiveFontSize(context, 80,
                    maxFontSize: 100, scalingFactor: 0.2),
                fontWeight: FontWeight.bold),
            updateCallback: (numLines) {
              numLines > 1 ? isSingleLine = false : isSingleLine = true;
            },
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
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
            ),
            isSingleLine! // Is the 'about me' single line?
                ? SizedBox(
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
                  )
                : const SizedBox(), // if not then have nothing on the side
          ],
        ),
      ],
    );
  }
}
