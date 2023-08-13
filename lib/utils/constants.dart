import 'package:bwc_web1/utils/color_gradient.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

class Constants {
  Color mainColorTheme() {
    return // COLOR THEMES
        const Color.fromARGB(255, 104, 160, 88);
    // const Color.fromARGB(255, 152, 152, 137); // GREEN SAGE
    // const Color.fromARGB(255, 6, 112, 92); // TEAL
    // const Color.fromARGB(255, 112, 6, 98); // VIOLET
  }

  List<Color> backgroundColorGradient() {
    return ColorListSeemless.withMainColor(
      mainColor: Constants().mainColorTheme(),
      opacity: 0.5,
      amount: 11,
      hueDegree: 120,
    );
  }

  String aboutMeFirstParagraph() {
    String aboutMeFirstParagraph =
        // chill
        // '''Overflowing with passion for design and technology, I'm a recent graduate with a strong educational background in Computer Science and Mechatronics. I got my Bachelor's Degree in Computer Science, where I learned about micro frontend stuff and how to use React.js to make cool things like a Human Resource website. I also got an Associate Degree in Mechatronics, which is about designing and programming things that work together. The most exciting part was my Final Project, where I made a super cool 3D Engraving Machine using Visual Basic .NET as the software interface. I'm really into learning by doing and creating things, especially with Flutter. Now, I'm all set to channel this enthusiasm into building this website and diving headfirst into the field. I can't wait to gain hands-on experience and make my mark by crafting amazing digital experiences that people will love.''';
        // passionate
        '''Bubbling over with a genuine passion for design and technology, I'm a recent graduate with a unique journey. My first achievement was earning an Associate Degree in Mechatronics, which opened my eyes to the art of crafting seamless interactions between various components. The culmination of this phase was my exhilarating Final Project—a captivating 3D Engraving Machine brought to life using Visual Basic .NET. Building upon this foundation, I pursued a Bachelor's Degree in Computer Science. Here, I delved into micro frontend concepts and the art of creating user-friendly experiences using React.js. With a deep love for hands-on learning and creative exploration, I'm thrilled to embark on this website endeavor. It's all part of my humble beginnings in the field, where I aspire to contribute to the realm of captivating digital experiences that resonate with people.''';
    return aboutMeFirstParagraph;
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

  TextStyle responsiveTextStyleSubTitle(BuildContext context) {
    double responsivefontSizeMedium1 = responsiveFontSize(
      context,
      46,
      scalingFactor: 0.2,
    );
    return DefaultTextStyle.of(context).style.copyWith(
        fontSize: responsivefontSizeMedium1, fontWeight: FontWeight.bold);
  }
}
