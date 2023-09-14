import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/constants/custom_colors.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

class Constants {
  CustomColors get customColors => const CustomColors();

  List<Color> backgroundColorGradient() {
    return ColorGradientGenerator.withMainColor(
      mainColor: Constants().customColors.mainThemeColor.greenLime,
      opacity: 0.5,
      amount: 11,
      hueDegree: 120,
    );
  }

  String frontPageIntroductionParagraph() {
    String frontPageIntroductionParagraph =
        '''Hey there! I'm just a Computer Science student from Indonesia who enjoys learing by doing stuff. So, I made this website using Flutter, you know, to learn how to build a responsive website with only Flutter. No, biggie, just trying things out!''';
    return frontPageIntroductionParagraph;
  }

  String aboutMeSection1Paragraph() {
    String aboutMeSection1Paragraph =
        // chill
        // '''Overflowing with passion for design and technology, I'm a recent graduate with a strong educational background in Computer Science and Mechatronics. I got my Bachelor's Degree in Computer Science, where I learned about micro frontend stuff and how to use React.js to make cool things like a Human Resource website. I also got an Associate Degree in Mechatronics, which is about designing and programming things that work together. The most exciting part was my Final Project, where I made a super cool 3D Engraving Machine using Visual Basic .NET as the software interface. I'm really into learning by doing and creating things, especially with Flutter. Now, I'm all set to channel this enthusiasm into building this website and diving headfirst into the field. I can't wait to gain hands-on experience and make my mark by crafting amazing digital experiences that people will love.''';
        // passionate
        // '''Bubbling over with a genuine passion for design and technology, I'm a recent graduate with a unique journey. My first achievement was earning an Associate Degree in Mechatronics, which opened my eyes to the art of crafting seamless interactions between various components. The culmination of this phase was my exhilarating Final Project—a captivating 3D Engraving Machine brought to life using Visual Basic .NET. Building upon this foundation, I pursued a Bachelor's Degree in Computer Science. Here, I delved into micro frontend concepts and the art of creating user-friendly experiences using React.js. With a deep love for hands-on learning and creative exploration, I'm thrilled to embark on this website endeavor. It's all part of my humble beginnings in the field, where I aspire to contribute to the realm of captivating digital experiences that resonate with people.''';
        // '''I am Verrel, a recent graduate Computer Science student with a growing interest in arts and technology. With a deep love for hands-on learning and creative exploration, I'm thrilled to embark on this website endeavor. It's all part of my humble beginnings in the field, where I aspire to contribute to the realm of captivating digital experiences that resonate with people.''';
        '''Hello, I'm Verrel (but I go by the name "boyzwhocried" on the internet), and I recently graduated in Computer Science. I always have a growing interest in arts and technology, but lately I've become really interested in combining them both. I enjoy hands-on learning and being creative, so I'm excited about starting this website project. It's a small beginning for me, but I hope to create digital experiences that people will love. My goal is to make websites that feel amazing and connect with people in meaningful ways as I start my journey in this field.''';
    return aboutMeSection1Paragraph;
  }

  String aboutMeSection2Paragraph() {
    String aboutMeSection2Paragraph =
        '''My first achievement was earning an Associate Degree in Mechatronics from Manufacturing Polytechnic Bandung, which opened my eyes to the art of crafting seamless interactions between various hardware and software components. The culmination of this phase was my exhilarating Final Project—a captivating 3D Engraving Machine brought to life using Visual Basic .NET.'''
        '''\n\n'''
        '''Building upon this foundation, I pursued a Bachelor's Degree in Computer Science from Binus University. Here, I delved into micro frontend concepts and the art of creating user-friendly experiences using React.js to build a human resource app for a company's task management.'''
        '''\n\n'''
        '''I also have completed a few courses and certifications in Flutter and Dart, Stragtegic Management, Statistic and Probability, and English.''';
    return aboutMeSection2Paragraph;
  }

  TextStyle responsiveTextStyleContent(BuildContext context) {
    double responsiveFontSizeSmall1 = responsiveFontSize(
      context,
      16,
      scalingFactor: 0.15,
    );
    return DefaultTextStyle.of(context)
        .style
        .copyWith(fontSize: responsiveFontSizeSmall1);
  }

  TextStyle responsiveTextStyleFooters(BuildContext context) {
    double responsiveFontSizeSmall1 = responsiveFontSize(
      context,
      14,
      scalingFactor: 0.15,
    );
    return DefaultTextStyle.of(context)
        .style
        .copyWith(fontSize: responsiveFontSizeSmall1);
  }

  TextStyle responsiveTextStyleSubTitle(BuildContext context) {
    double responsivefontSizeMedium1 = responsiveFontSize(
      context,
      46,
      scalingFactor: 0.2,
    );
    return DefaultTextStyle.of(context).style.copyWith(
        fontSize: responsivefontSizeMedium1, fontWeight: FontWeight.bold);
  }

  TextStyle defaultTextStyle(BuildContext context) {
    return DefaultTextStyle.of(context).style;
  }
}
