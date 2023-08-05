import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_spin_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all((12 / 100) * getScreenWidth(context)),
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedFadeInWidget(
                  startDelay: const Duration(milliseconds: 500),
                  child: Container(
                    alignment: Alignment.centerRight,
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
                            maxFontSize: 150,
                          ),
                          height: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 150,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The cusp of art and technology has always fascinated me and I\'ve never been afraid to just jump in and give it a go, whether it\'s Paint, Photoshop, Sketch or CSS. I’ve been designing with computers since the day I first opened Microsoft Paint. Fast forward to 2023 and I\’ve tried it all, from Digital Campaign Design and Flash Actionscript to Web Design, Animation, HTML/CSS, No-Code Web Development, Product Design and Product Management. Everything I have done, small or big, has been a vital stepping stone for where I am today. What excites me most about being a Product Designer is being able to design and create things that have purpose and solve real problems. It goes beyond designing buttons and websites and involves having a passion for designing experiences and solutions that help people, whether it\'s helping them make better videos, market themselves online, or buy something online. Leaning into customer insight and understanding their needs, finding the right problems to solve, delivering solutions as quickly as possible, learning from those and then iterating and improving that value over time is the key to great product design.',
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontSize: responsiveFontSize(context, 9)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
