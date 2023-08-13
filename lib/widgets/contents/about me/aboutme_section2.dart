import 'package:bwc_web1/utils/constants.dart';
import 'package:bwc_web1/utils/lorem_ipsum_generator.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:flutter/material.dart';

class AboutMeSection2 extends StatelessWidget {
  const AboutMeSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white24,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: responsivePaddingSize(context, 2),
          horizontal: responsivePaddingSize(context, 5),
        ),
        child: Column(
          children: [
            Text(
              'academic journey',
              style: Constants().responsiveTextStyleSubTitle(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: responsivePaddingSize(context, 2),
              ),
              child: Text(
                generateLoremIpsum(100),
                style: Constants().responsiveTextStyleContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
