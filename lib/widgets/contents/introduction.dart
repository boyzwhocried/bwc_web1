import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_word_in_paragraph.dart';
import 'package:flutter/material.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedFadeInWidget(
          slideDirection: SlideDirection.topToBottom,
          curveType: Curves.easeInOutCubic,
          startDelay: const Duration(milliseconds: 200),
          child: Row(
            children: [
              Text(
                'I am ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: responsiveFontSize(context, 46),
                ),
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'boyz',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFontSize(context, 46),
                    ),
                  ),
                  TypewriterAnimatedText(
                    'who',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFontSize(context, 46),
                    ),
                  ),
                  TypewriterAnimatedText(
                    'cried',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFontSize(context, 46),
                    ),
                  ),
                  TypewriterAnimatedText(
                    'verrel',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFontSize(context, 46),
                    ),
                  ),
                  TypewriterAnimatedText(
                    'open\nto work',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsiveFontSize(context, 46) / 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedFadeInWidget(
          curveType: Curves.easeInOutCubic,
          startDelay: const Duration(milliseconds: 400),
          child: AnimatedWordsInParagraph(
            textStyle: DefaultTextStyle.of(context)
                .style
                .copyWith(fontSize: responsiveFontSize(context, 9)),
            paragraph: Constants().frontPageIntroductionParagraph(),
            animatedWords: [
              AnimatedWord(
                word: 'Computer Science',
                colors: ColorGradientText.getColorList(
                    context, Pastel7Colorful.withAlpha()),
                onTap: () {
                  urlLaunchInBrowser(
                      'https://en.wikipedia.org/wiki/Computer_science');
                },
              ),
              AnimatedWord(
                word: 'Flutter,',
                colors: ColorGradientText.getColorList(
                    context, [Colors.lightBlueAccent]),
                onTap: () {
                  urlLaunchInBrowser('https://flutter.dev/');
                },
              ),
              AnimatedWord(
                word: 'Flutter.',
                colors: ColorGradientText.getColorList(
                    context, [Colors.lightBlueAccent]),
                onTap: () {
                  urlLaunchInBrowser('https://flutter.dev/');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
