import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bwc_web1/provider/dark_mode_provider.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/utils/on_hover_animated_text.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroductionSection extends StatefulWidget {
  const IntroductionSection({super.key});

  @override
  State<IntroductionSection> createState() => _IntroductionSectionState();
}

class _IntroductionSectionState extends State<IntroductionSection> {
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
        // AnimatedFadeInText(
        //   textStyle: TextStyle(
        //     fontSize: 9 + getScreenWidth(context) / 100,
        //   ),
        //   curveType: Curves.easeInOutCubic,
        //   delay: const Duration(milliseconds: 1000),
        //   text:
        //       'Hey there! I\'m just a Computer Science student from Indonesia who enjoys learning by doing stuff. So, I made this website using Flutter, you know, to learn how to build a responsive website with only Flutter. No biggie, just trying things out!',
        // ),
        Consumer<DarkModeProvider>(builder: (context, darkModeProvider, child) {
          return AnimatedFadeInWidget(
            curveType: Curves.easeInOutCubic,
            startDelay: const Duration(milliseconds: 1000),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontSize: 9 + getScreenWidth(context) / 100),
                children: <TextSpan>[
                  const TextSpan(text: 'Hey there! I\'m just a '),
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: OnHoverAnimatedText(
                          text: 'Computer Science',
                          fontStyle: DefaultTextStyle.of(context)
                              .style
                              .copyWith(
                                  fontSize: 9 + getScreenWidth(context) / 100),
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
                              .copyWith(
                                  fontSize: 9 + getScreenWidth(context) / 100),
                          colors: [
                            darkModeProvider.isDarkMode
                                ? ThemeData.dark().textTheme.bodyMedium!.color!
                                : ThemeData.light()
                                    .textTheme
                                    .bodyMedium!
                                    .color!,
                            Colors.lightBlueAccent,
                            darkModeProvider.isDarkMode
                                ? ThemeData.dark().textTheme.bodyMedium!.color!
                                : ThemeData.light()
                                    .textTheme
                                    .bodyMedium!
                                    .color!,
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
                              .copyWith(
                                  fontSize: 9 + getScreenWidth(context) / 100),
                          colors: [
                            darkModeProvider.isDarkMode
                                ? ThemeData.dark().textTheme.bodyMedium!.color!
                                : ThemeData.light()
                                    .textTheme
                                    .bodyMedium!
                                    .color!,
                            Colors.lightBlueAccent,
                            darkModeProvider.isDarkMode
                                ? ThemeData.dark().textTheme.bodyMedium!.color!
                                : ThemeData.light()
                                    .textTheme
                                    .bodyMedium!
                                    .color!,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const TextSpan(text: 'No biggie, just trying things out!'),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
