import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/responsive_fontsize.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

    return Column(
      children: [
        AnimatedFadeInWidget(
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
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontSize: responsiveFontSize(context, 9)),
              children: <TextSpan>[
                const TextSpan(text: 'Hey there! I\'m just a '),
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: OnHoverAnimatedText(
                        text: 'Computer Science',
                        fontStyle: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: responsiveFontSize(context, 9)),
                        colors: darkModeProvider.isDarkMode
                            ? Pastel7ColorfulTextDark.colorList
                            : Pastel7ColorfulTextLight.colorList,
                      ),
                    ),
                  ],
                ),
                const TextSpan(
                    text:
                        ' student from Indonesia who enjoys learning by doing stuff. So, I made this website using '),
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: OnHoverAnimatedText(
                        text: 'Flutter ',
                        fontStyle: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: responsiveFontSize(context, 9)),
                        colors: [
                          darkModeProvider.isDarkMode
                              ? ThemeData.dark().textTheme.bodyMedium!.color!
                              : ThemeData.light().textTheme.bodyMedium!.color!,
                          Colors.lightBlueAccent,
                          darkModeProvider.isDarkMode
                              ? ThemeData.dark().textTheme.bodyMedium!.color!
                              : ThemeData.light().textTheme.bodyMedium!.color!,
                        ],
                      ),
                    ),
                  ],
                ),
                const TextSpan(
                    text:
                        ', you know, to learn how to build a responsive website with only '),
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: OnHoverAnimatedText(
                        text: 'Flutter. ',
                        fontStyle: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: responsiveFontSize(context, 9)),
                        colors: [
                          darkModeProvider.isDarkMode
                              ? ThemeData.dark().textTheme.bodyMedium!.color!
                              : ThemeData.light().textTheme.bodyMedium!.color!,
                          Colors.lightBlueAccent,
                          darkModeProvider.isDarkMode
                              ? ThemeData.dark().textTheme.bodyMedium!.color!
                              : ThemeData.light().textTheme.bodyMedium!.color!,
                        ],
                      ),
                    ),
                  ],
                ),
                const TextSpan(text: 'No biggie, just trying things out!'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
