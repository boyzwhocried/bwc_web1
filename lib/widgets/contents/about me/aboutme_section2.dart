import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_word_in_paragraph.dart';
import 'package:flutter/material.dart';

class AboutMeSection2 extends StatelessWidget {
  const AboutMeSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: responsivePaddingSize(context, 3),
      ),
      padding: EdgeInsets.symmetric(
        vertical: responsivePaddingSize(context, 3),
        horizontal: responsivePaddingSize(context, 5),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white24,
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
            child: Column(
              children: [
                
                AnimatedWordsInParagraph(
                  paragraph: Constants().aboutMeSection2Paragraph(),
                  animatedWords: [
                    AnimatedWord(
                      word: 'Manufacturing Polytechnic Bandung,',
                      colors: ColorGradientText.getColorList(
                        context,
                        [
                          const Color.fromARGB(255, 130, 135, 141),
                          const Color.fromARGB(255, 33, 62, 125),
                          const Color.fromARGB(255, 33, 62, 125),
                        ],
                      ),
                      speed: const Duration(milliseconds: 100),
                      onTap: () {
                        urlLaunchInBrowser('https://polman-bandung.ac.id/');
                      },
                    ),
                    AnimatedWord(
                      word: 'Binus University.',
                      colors: ColorGradientText.getColorList(
                        context,
                        [
                          const Color.fromARGB(255, 0, 142, 211),
                          const Color.fromARGB(255, 183, 105, 22),
                          const Color.fromARGB(255, 183, 105, 22),
                        ],
                      ),
                      onTap: () {
                        urlLaunchInBrowser('https://binus.ac.id/');
                      },
                    ),
                  ],
                  textStyle: Constants().responsiveTextStyleContent(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
