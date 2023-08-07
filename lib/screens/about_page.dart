import 'package:bwc_web1/utils/lorem_ipsum_generator.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/contents/custom_about.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_spin_widget.dart';
import 'package:bwc_web1/widgets/custom/on_text_line_change.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (12 / 100) * getScreenWidth(context),
            vertical: (5 / 100) * getScreenWidth(context)),
        child: const SmallAbout(),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: (7 / 100) * getScreenWidth(context)),
                child: AnimatedFadeInWidget(
                  startDelay: const Duration(milliseconds: 500),
                  child: AnimatedSpinWidget(
                    endRotationDegree: 420,
                    delayedStart: true,
                    delayDuration: const Duration(milliseconds: 500),
                    spinCurve: Curves.easeInOutCubic,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        height: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const CustomAboutContent1(),
          ],
        ),
      ],
    );
  }
}

class SmallAbout extends StatelessWidget {
  const SmallAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: (7 / 100) * getScreenWidth(context)),
                child: AnimatedFadeInWidget(
                  startDelay: const Duration(milliseconds: 500),
                  child: AnimatedSpinWidget(
                    endRotationDegree: 420,
                    delayedStart: true,
                    delayDuration: const Duration(milliseconds: 500),
                    spinCurve: Curves.easeInOutCubic,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        height: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeInWidget(
                  slideDirection: SlideDirection.rightToLeft,
                  startDelay: const Duration(milliseconds: 200),
                  child: Text(
                    'about me',
                    style: TextStyle(
                        fontSize: responsiveFontSize(context, 60,
                            maxFontSize: 80, scalingFactor: 0.2),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: (1 / 100) * getScreenWidth(context),
                  ),
                  child: Text(
                    generateLoremIpsum(100),
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: responsiveFontSize(context, 9)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class LargeAbout extends StatelessWidget {
  const LargeAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedFadeInWidget(
                slideDirection: SlideDirection.rightToLeft,
                startDelay: const Duration(milliseconds: 200),
                child: Text(
                  'about me',
                  style: TextStyle(
                      fontSize: responsiveFontSize(context, 80,
                          maxFontSize: 100, scalingFactor: 0.2),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: (1 / 100) * getScreenWidth(context),
                ),
                child: Text(
                  generateLoremIpsum(100),
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontSize: responsiveFontSize(context, 9)),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: (7 / 100) * getScreenWidth(context)),
            child: AnimatedFadeInWidget(
              startDelay: const Duration(milliseconds: 500),
              child: AnimatedSpinWidget(
                endRotationDegree: 420,
                delayedStart: true,
                delayDuration: const Duration(milliseconds: 500),
                spinCurve: Curves.easeInOutCubic,
                child:
                    //  SizedBox(
                    //   height: responsiveFontSize(
                    //     context,
                    //     100,
                    //     maxFontSize: 140,
                    //   ),
                    //   width: responsiveFontSize(
                    //     context,
                    //     100,
                    //     maxFontSize: 140,
                    //   ),
                    // ),
                    ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: responsiveFontSize(
                      context,
                      100,
                      maxFontSize: 140,
                    ),
                    height: responsiveFontSize(
                      context,
                      100,
                      maxFontSize: 140,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MediumAbout extends StatelessWidget {
  const MediumAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      // TEXT2
                      Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: (1 / 100) * getScreenWidth(context),
                    ),
                    child: Text(
                      generateLoremIpsum(100),
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: responsiveFontSize(context, 9)),
                    ),
                  ),
                ),
                // IMAGE
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: (7 / 100) * getScreenWidth(context)),
                  child: AnimatedFadeInWidget(
                    startDelay: const Duration(milliseconds: 500),
                    child: AnimatedSpinWidget(
                      endRotationDegree: 420,
                      delayedStart: true,
                      delayDuration: const Duration(milliseconds: 500),
                      spinCurve: Curves.easeInOutCubic,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 140,
                          ),
                          height: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 140,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // TEXT1
            AnimatedFadeInWidget(
              slideDirection: SlideDirection.rightToLeft,
              startDelay: const Duration(milliseconds: 200),
              child: Text(
                'about me',
                style: TextStyle(
                    fontSize: responsiveFontSize(context, 80,
                        maxFontSize: 100, scalingFactor: 0.2),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class About2 extends StatelessWidget {
  const About2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final double textHeight = renderBox.size.height;
      final int numLines = (textHeight /
              responsiveFontSize(context, 80,
                  maxFontSize: 100, scalingFactor: 0.2))
          .ceil();
      String textContent = "about me";
      if (numLines > 1) {
        // textContent = "about me2";
        print(numLines);
      } else {
        // textContent = "about me";
        print(numLines);
      }
      return Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: (7 / 100) * getScreenWidth(context)),
                  child: AnimatedFadeInWidget(
                    startDelay: const Duration(milliseconds: 500),
                    child: AnimatedSpinWidget(
                      endRotationDegree: 420,
                      delayedStart: true,
                      delayDuration: const Duration(milliseconds: 500),
                      spinCurve: Curves.easeInOutCubic,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 140,
                          ),
                          height: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 140,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  AnimatedFadeInWidget(
                    slideDirection: SlideDirection.rightToLeft,
                    startDelay: const Duration(milliseconds: 200),
                    child: Text(
                      textContent,
                      style: TextStyle(
                          fontSize: responsiveFontSize(context, 80,
                              maxFontSize: 100, scalingFactor: 0.2),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: (1 / 100) * getScreenWidth(context),
                    ),
                    child: Text(
                      generateLoremIpsum(100),
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: responsiveFontSize(context, 9)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}

class About3 extends StatelessWidget {
  const About3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: (7 / 100) * getScreenWidth(context)),
            child: AnimatedFadeInWidget(
              startDelay: const Duration(milliseconds: 500),
              child: AnimatedSpinWidget(
                endRotationDegree: 420,
                delayedStart: true,
                delayDuration: const Duration(milliseconds: 500),
                spinCurve: Curves.easeInOutCubic,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: responsiveFontSize(
                      context,
                      100,
                      maxFontSize: 140,
                    ),
                    height: responsiveFontSize(
                      context,
                      100,
                      maxFontSize: 140,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            AnimatedFadeInWidget(
              slideDirection: SlideDirection.rightToLeft,
              startDelay: const Duration(milliseconds: 200),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final RenderBox renderBox =
                      context.findRenderObject() as RenderBox;
                  final double textHeight = renderBox.size.height;
                  final int numLines = (textHeight /
                          responsiveFontSize(context, 80,
                              maxFontSize: 100, scalingFactor: 0.2))
                      .ceil();
                  String textContent = "about me";
                  // if (numLines > 1) {
                  //   // textContent = "about me2";
                  //   print(numLines);
                  // } else {
                  //   // textContent = "about me";
                  // print(numLines);
                  // }
                  print(numLines);
                  return Text(
                    textContent,
                    style: TextStyle(
                        fontSize: responsiveFontSize(context, 80,
                            maxFontSize: 100, scalingFactor: 0.2),
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: (1 / 100) * getScreenWidth(context),
              ),
              child: Text(
                generateLoremIpsum(100),
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontSize: responsiveFontSize(context, 9)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class About4 extends StatelessWidget {
  const About4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      // TEXT2
                      Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: (1 / 100) * getScreenWidth(context),
                    ),
                    child: Text(
                      generateLoremIpsum(100),
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: responsiveFontSize(context, 9)),
                    ),
                  ),
                ),
                // IMAGE
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: (7 / 100) * getScreenWidth(context)),
                  child: AnimatedFadeInWidget(
                    startDelay: const Duration(milliseconds: 500),
                    child: AnimatedSpinWidget(
                      endRotationDegree: 420,
                      delayedStart: true,
                      delayDuration: const Duration(milliseconds: 500),
                      spinCurve: Curves.easeInOutCubic,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 140,
                          ),
                          height: responsiveFontSize(
                            context,
                            100,
                            maxFontSize: 140,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // TEXT1
            AnimatedFadeInWidget(
              slideDirection: SlideDirection.rightToLeft,
              startDelay: const Duration(milliseconds: 200),
              child: Text(
                'about me',
                style: TextStyle(
                    fontSize: responsiveFontSize(context, 80,
                        maxFontSize: 100, scalingFactor: 0.2),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class About5 extends StatefulWidget {
  const About5({
    super.key,
  });

  @override
  State<About5> createState() => _About5State();
}

bool _isSingleLine = false;
bool _isSwitchTriggered = false;

class _About5State extends State<About5> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: (7 / 100) * getScreenWidth(context)),
                child: AnimatedFadeInWidget(
                  startDelay: const Duration(milliseconds: 500),
                  child: AnimatedSpinWidget(
                    endRotationDegree: 420,
                    delayedStart: true,
                    delayDuration: const Duration(milliseconds: 500),
                    spinCurve: Curves.easeInOutCubic,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        height: responsiveFontSize(
                          context,
                          100,
                          maxFontSize: 140,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeInWidget(
                  slideDirection: SlideDirection.rightToLeft,
                  startDelay: const Duration(milliseconds: 200),
                  child: OnTextLineChanges(
                    text: 'about me',
                    style: TextStyle(
                        fontSize: responsiveFontSize(context, 80,
                            maxFontSize: 100, scalingFactor: 0.2),
                        fontWeight: FontWeight.bold),
                    updateCallback: (numLines) {
                      // setState(() {});
                      print('call back intiated $numLines lines');
                      _switchAboutView(numLines);
                    },
                  ),
                ),
                _isSwitchTriggered
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: (1 / 100) * getScreenWidth(context),
                              ),
                              child: Text(
                                generateLoremIpsum(100),
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 9)),
                              ),
                            ),
                          ),
                          _isSingleLine // Is the 'about me' single line?
                              ? SizedBox(
                                  width: responsiveFontSize(
                                    context,
                                    100,
                                    maxFontSize: 140,
                                  ),
                                  height: responsiveFontSize(
                                    context,
                                    100,
                                    maxFontSize: 140,
                                  ),
                                )
                              : const SizedBox(), // if not then have nothing on the side
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

void _switchAboutView(int numLines) {
  _isSwitchTriggered = true;

  // if (numLines ==null) {

  // }
  // else
  if (numLines > 1) {
    _isSingleLine = false;
    print('more than 1 line');
  } else {
    _isSingleLine = true;
    print('less than 1 line');
  }
}
