import 'package:bwc_web1/utils/responsive_fontsize.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_text.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all((12 / 100) * getScreenWidth(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedFadeInWidget(
              slideDirection: SlideDirection.rightToLeft,
              startDelay: Duration(milliseconds: 200),
              child: Text(
                'about me',
                style: TextStyle(
                    fontSize: responsiveFontSize(context, 80,
                        maxFontSize: 100, scalingFactor: 0.2),
                    fontWeight: FontWeight.bold),
              ),
            ),
            CircleAvatar(
              radius: 40 + (getScreenWidth(context) / 50),
              // backgroundImage: const AssetImage('assets/images/profile.jpg'),
              child: Image.asset('assets/images/profile.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}

//https://drive.google.com/file/d/13nF0rj_7YsZxtBuprPn1S3xQBtJI49zO/view?usp=sharing