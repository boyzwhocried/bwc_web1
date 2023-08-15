import 'package:bwc_web1/utils/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:flutter/material.dart';

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
