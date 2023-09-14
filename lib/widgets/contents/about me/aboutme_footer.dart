import 'package:bwc_web1/widgets/spotify_track_widget.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_text.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_widget.dart';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpotifyTrack(),
              Text(
                '© • 2023 • boyzwhocried',
                style: TextStyle(
                    fontSize: Constants()
                            .responsiveTextStyleFooters(context)
                            .fontSize! -
                        2),
              ),
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
                            .responsiveTextStyleFooters(context)
                            .fontSize! +
                        2),
              ),
              const SizedBox(height: 5),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'instagram',
                  onTap: () {
                    urlLaunchInBrowser(
                        'https://www.instagram.com/boyzwhocried/');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.instagram,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 300),
                  text: 'instagram(film)',
                  onTap: () {
                    urlLaunchInBrowser(
                        'https://www.instagram.com/daydreamers_mind/');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.instagram,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'github',
                  onTap: () {
                    urlLaunchInBrowser('https://github.com/boyzwhocried');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.github,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'linkedin',
                  onTap: () {
                    urlLaunchInBrowser(
                        'https://linkedin.com/in/verrel-mohammad-al-syoumi-77ba5a161');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.linkedin,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'email',
                  onTap: () {
                    sendEmail('verrel.alsyoumi@gmail.com');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.google,
                  ),
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
                    Constants().responsiveTextStyleFooters(context).fontSize! +
                        2),
          ),
          const SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'instagram',
                  onTap: () {
                    urlLaunchInBrowser(
                        'https://www.instagram.com/boyzwhocried/');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.instagram,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 300),
                  text: 'instagram(film)',
                  onTap: () {
                    urlLaunchInBrowser(
                        'https://www.instagram.com/daydreamers_mind/');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.instagram,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'github',
                  onTap: () {
                    urlLaunchInBrowser('https://github.com/boyzwhocried');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.github,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'linkedin',
                  onTap: () {
                    urlLaunchInBrowser(
                        'https://linkedin.com/in/verrel-mohammad-al-syoumi-77ba5a161');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.linkedin,
                  ),
                ),
              ),
              OnHoverAniamatedWidget(
                scaleOnHover: 1.05,
                child: OnHoverAnimatedText(
                  speed: const Duration(milliseconds: 500),
                  text: 'email',
                  onTap: () {
                    sendEmail('verrel.alsyoumi@gmail.com');
                  },
                  fontStyle: Constants().responsiveTextStyleFooters(context),
                  colors: ColorGradientText.getColorList(
                    context,
                    Constants().customColors.logoColors.google,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text('© • 2023 • boyzwhocried'),
        ],
      ),
    );
  }
}
