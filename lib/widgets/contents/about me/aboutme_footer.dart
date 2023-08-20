import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_text.dart';
import 'package:flutter/material.dart';

class AboutMeFooter extends StatelessWidget {
  const AboutMeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: responsivePaddingSize(context, 3),
        bottom: responsiveFontSize(context, 1),
      ),
      child: getDeviceType(context) != DeviceType.phone
          ? const Layout1()
          : const Layout2(),
    );
  }
}

class Layout1 extends StatelessWidget {
  const Layout1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveFontSize(context, 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('© • 2023 • boyzwhocried'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'me elsewhere:',
                style: TextStyle(
                    fontSize: Constants()
                            .responsiveTextStyleContent(context)
                            .fontSize! +
                        2),
              ),
              const SizedBox(height: 5),
              OnHoverAnimatedText(
                speed: const Duration(milliseconds: 500),
                text: 'instagram',
                onTap: () {
                  urlLaunchInBrowser('https://www.instagram.com/boyzwhocried/');
                },
                fontStyle: Constants().responsiveTextStyleContent(context),
                colors: ColorGradientText.getColorList(
                  context,
                  Constants().customColors.logoColors.instagram,
                ),
              ),
              OnHoverAnimatedText(
                speed: const Duration(milliseconds: 300),
                text: 'instagram(film)',
                onTap: () {
                  urlLaunchInBrowser(
                      'https://www.instagram.com/daydreamers_mind/');
                },
                fontStyle: Constants().responsiveTextStyleContent(context),
                colors: ColorGradientText.getColorList(
                  context,
                  Constants().customColors.logoColors.instagram,
                ),
              ),
              OnHoverAnimatedText(
                speed: const Duration(milliseconds: 500),
                text: 'github',
                onTap: () {
                  urlLaunchInBrowser('https://github.com/boyzwhocried');
                },
                fontStyle: Constants().responsiveTextStyleContent(context),
                colors: ColorGradientText.getColorList(
                  context,
                  Constants().customColors.logoColors.github,
                ),
              ),
              OnHoverAnimatedText(
                speed: const Duration(milliseconds: 500),
                text: 'linkedin',
                onTap: () {
                  urlLaunchInBrowser(
                      'https://linkedin.com/in/verrel-mohammad-al-syoumi-77ba5a161');
                },
                fontStyle: Constants().responsiveTextStyleContent(context),
                colors: ColorGradientText.getColorList(
                  context,
                  Constants().customColors.logoColors.linkedin,
                ),
              ),
              OnHoverAnimatedText(
                speed: const Duration(milliseconds: 500),
                text: 'email',
                onTap: () {
                  sendEmail('verrel.alsyoumi@gmail.com');
                },
                fontStyle: Constants().responsiveTextStyleContent(context),
                colors: ColorGradientText.getColorList(
                  context,
                  Constants().customColors.logoColors.google,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Layout2 extends StatelessWidget {
  const Layout2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveFontSize(context, 220),
      child: Column(
        children: [
          Text(
            'me elsewhere:',
            style: TextStyle(
                fontSize:
                    Constants().responsiveTextStyleContent(context).fontSize! +
                        2),
          ),
          const SizedBox(height: 5),
          OnHoverAnimatedText(
            speed: const Duration(milliseconds: 500),
            text: 'instagram',
            onTap: () {
              urlLaunchInBrowser('https://www.instagram.com/boyzwhocried/');
            },
            fontStyle: Constants().responsiveTextStyleContent(context),
            colors: ColorGradientText.getColorList(
              context,
              Constants().customColors.logoColors.instagram,
            ),
          ),
          OnHoverAnimatedText(
            speed: const Duration(milliseconds: 300),
            text: 'instagram(film)',
            onTap: () {
              urlLaunchInBrowser('https://www.instagram.com/daydreamers_mind/');
            },
            fontStyle: Constants().responsiveTextStyleContent(context),
            colors: ColorGradientText.getColorList(
              context,
              Constants().customColors.logoColors.instagram,
            ),
          ),
          OnHoverAnimatedText(
            speed: const Duration(milliseconds: 500),
            text: 'github',
            onTap: () {
              urlLaunchInBrowser('https://github.com/boyzwhocried');
            },
            fontStyle: Constants().responsiveTextStyleContent(context),
            colors: ColorGradientText.getColorList(
              context,
              Constants().customColors.logoColors.github,
            ),
          ),
          OnHoverAnimatedText(
            speed: const Duration(milliseconds: 500),
            text: 'linkedin',
            onTap: () {
              urlLaunchInBrowser(
                  'https://linkedin.com/in/verrel-mohammad-al-syoumi-77ba5a161');
            },
            fontStyle: Constants().responsiveTextStyleContent(context),
            colors: ColorGradientText.getColorList(
              context,
              Constants().customColors.logoColors.linkedin,
            ),
          ),
          OnHoverAnimatedText(
            speed: const Duration(milliseconds: 500),
            text: 'email',
            onTap: () {
              sendEmail('verrel.alsyoumi@gmail.com');
            },
            fontStyle: Constants().responsiveTextStyleContent(context),
            colors: ColorGradientText.getColorList(
              context,
              Constants().customColors.logoColors.google,
            ),
          ),
          const Spacer(),
          const Text('© • 2023 • boyzwhocried'),
        ],
      ),
    );
  }
}
