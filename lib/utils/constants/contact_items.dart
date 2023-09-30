import 'package:bwc_web1/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class ContactItem {
  final String text;
  final String url;
  final List<Color> colors;

  ContactItem({
    required this.text,
    required this.url,
    required this.colors,
  });
}

final List<ContactItem> contactInfo = [
  ContactItem(
      text: 'instagram',
      url: 'https://www.instagram.com/boyzwhocried/',
      colors: Constants().customColors.logoColors.instagram),
  ContactItem(
      text: 'instagram(film)',
      url: 'https://www.instagram.com/daydreamers_mind/',
      colors: Constants().customColors.logoColors.instagram),
  ContactItem(
      text: 'github',
      url: 'https://github.com/boyzwhocried',
      colors: Constants().customColors.logoColors.github),
  ContactItem(
      text: 'linkedin',
      url: 'https://linkedin.com/in/verrel-mohammad-al-syoumi-77ba5a161',
      colors: Constants().customColors.logoColors.linkedin),
  ContactItem(
      text: 'email',
      url: 'mailto:verrel.alsyoumi@gmail.com',
      colors: Constants().customColors.logoColors.google),
  ContactItem(
      text: 'CV',
      url: 'https://resume.io/r/7yCEg6KQo',
      colors: [Constants().customColors.mainThemeColor.greenSage]),
];
