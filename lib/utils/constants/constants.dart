import 'package:flutter/material.dart';
import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants/custom_colors.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';

class Constants {
  // Use a constructor to create a single instance of CustomColors
  final CustomColors customColors = const CustomColors();

  // Generate a background color gradient
  List<Color> backgroundColorGradient() {
    return ColorUtils.generateColorGradient(
      mainColor: customColors.mainThemeColor.greenLime,
      opacity: 0.5,
      amount: 11,
      hueDegree: 120,
    );
  }

  // Front page introduction paragraph
  String frontPageIntroductionParagraph() {
    return '''Hello! I'm a Computer Science student from Indonesia who enjoys learning by doing. I built this website using Flutter to explore building a responsive website. It's all about trying things out!''';
  }

  // About me section - paragraph 1
  String aboutMeSection1Paragraph() {
    return '''Hello, I'm Verrel (known as "boyzwhocried" online), a recent Computer Science graduate. I have a growing interest in arts and technology, and I'm excited to combine them. I love hands-on learning and creativity, and I'm looking forward to starting this website project. While it's a small beginning for me, I aim to create digital experiences that people will love as I begin my journey in this field.''';
  }

  // About me section - paragraph 2
  String aboutMeSection2Paragraph() {
    return '''My journey started with an Associate Degree in Mechatronics from Manufacturing Polytechnic Bandung, where I learned to craft seamless interactions between hardware and software components. My final project was a 3D Engraving Machine using Visual Basic .NET.

    I then pursued a Bachelor's Degree in Computer Science at Binus University, diving into micro frontend concepts and creating user-friendly experiences using React.js to build a human resource app for a company's task management.

    I've also completed various courses and certifications in Flutter, Dart, Strategic Management, Statistics, Probability, and English.''';
  }

  // Create a responsive text style for content
  TextStyle responsiveTextStyleContent(BuildContext context) {
    return DefaultTextStyle.of(context).style.copyWith(
          fontSize: responsiveFontSize(context, 16, scalingFactor: 0.15),
        );
  }

  // Create a responsive text style for footers
  TextStyle responsiveTextStyleFooters(BuildContext context) {
    return DefaultTextStyle.of(context).style.copyWith(
          fontSize: responsiveFontSize(context, 14, scalingFactor: 0.15),
        );
  }

  // Create a responsive text style for subtitles
  TextStyle responsiveTextStyleSubTitle(BuildContext context) {
    return DefaultTextStyle.of(context).style.copyWith(
          fontSize: responsiveFontSize(context, 46, scalingFactor: 0.2),
          fontWeight: FontWeight.bold,
        );
  }

  // Get the default text style for the context
  TextStyle defaultTextStyle(BuildContext context) {
    return DefaultTextStyle.of(context).style;
  }
}
