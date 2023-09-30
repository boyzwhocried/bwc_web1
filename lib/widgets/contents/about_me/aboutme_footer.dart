import 'package:bwc_web1/utils/constants/contact_items.dart';
import 'package:flutter/material.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/utils/url_launcher.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_text.dart';
import 'package:bwc_web1/widgets/custom/on_hover_animated_widget.dart';
import 'package:bwc_web1/widgets/custom/spotify/playlist_from_server/spotify_playlist_widget.dart';

class AboutMeFooter extends StatelessWidget {
  const AboutMeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: responsivePaddingSize(context, 3),
        bottom: responsiveFontSize(context, 1),
      ),
      child: getDeviceType(context) != DeviceType.phone
          ? const Layout1() // Desktop & Tablet
          : const Layout2(), // Phone
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  final List<ContactItem> contactInfo;

  const ContactInfoWidget({
    super.key,
    required this.contactInfo,
  });

  @override
  Widget build(BuildContext context) {
    final contactInfoWidgets =
        contactInfo.map((item) => _buildContactText(item, context)).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: getDeviceType(context) == DeviceType.phone
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'me elsewhere:',
          style: TextStyle(
            fontSize:
                Constants().responsiveTextStyleFooters(context).fontSize! + 2,
          ),
        ),
        const SizedBox(height: 5),
        ...contactInfoWidgets,
      ],
    );
  }

  Widget _buildContactText(ContactItem item, BuildContext context) {
    return OnHoverAnimatedWidget(
      scaleOnHover: 1.05,
      child: OnHoverAnimatedText(
        speed: const Duration(milliseconds: 500),
        text: item.text,
        onTap: () {
          urlLaunchInBrowser(item.url);
        },
        fontStyle: Constants().responsiveTextStyleFooters(context),
        colors: ColorUtils.getColorList(context, item.colors),
      ),
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
          _buildColumn(context),
          ContactInfoWidget(contactInfo: contactInfo),
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OnHoverAnimatedWidget(
          scaleOnHover: 1.03,
          child: SpotifyPlaylistWidget(isSmall: false),
        ),
        Text(
          '© • 2023 • boyzwhocried',
          style: TextStyle(
            fontSize:
                Constants().responsiveTextStyleFooters(context).fontSize! - 2,
          ),
        ),
      ],
    );
  }
}

class Layout2 extends StatelessWidget {
  const Layout2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveFontSize(context, 320),
      child: Column(
        children: [
          const OnHoverAnimatedWidget(
            scaleOnHover: 1.03,
            child: SpotifyPlaylistWidget(isSmall: true),
          ),
          const Spacer(),
          ContactInfoWidget(contactInfo: contactInfo),
          const Spacer(),
          const Text('© • 2023 • boyzwhocried'),
        ],
      ),
    );
  }
}
