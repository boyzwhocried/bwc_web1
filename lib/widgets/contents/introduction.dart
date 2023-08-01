import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_text.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedFadeInWidget(
          curveType: Curves.easeInOutCubic,
          startDelay: const Duration(milliseconds: 700),
          child: Row(
            children: [
              Text(
                'I am ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 46 + getScreenWidth(context) / 100,
                ),
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'boyz',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 46 + getScreenWidth(context) / 100,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'who',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 46 + getScreenWidth(context) / 100,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'cried',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 46 + getScreenWidth(context) / 100,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'verrel',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 46 + getScreenWidth(context) / 100,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'open\nto work',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: (46 + getScreenWidth(context) / 100) / 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedFadeInText(
          textStyle: TextStyle(
            fontSize: 9 + getScreenWidth(context) / 100,
          ),
          curveType: Curves.easeInOutCubic,
          delay: const Duration(milliseconds: 1000),
          text:
              'Hey there! I\'m just a Computer Science student from Indonesia who enjoys learning by doing stuff. So, I made this website using Flutter, you know, to learn how to build a responsive website with only Flutter. No biggie, just trying things out!',
          // 'I am a Computer Science student based in Indonesia who like to learn things by doing it. This website was fully made with Flutter with intention of learning to build a responsive website with only Flutter.',
          // child: Text(
          //   'I am a Computer Science student who like to learn things by doing it. This website was fully made with Flutter with intention of learning to build a responsive website with only Flutter.',
          //   textAlign: TextAlign.left,
          //   style: TextStyle(
          //     fontSize: 8 + getScreenWidth(context) / 100,
          //   ),
          // ),
        ),
      ],
    );
  }
}
