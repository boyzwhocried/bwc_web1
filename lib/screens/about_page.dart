import 'package:bwc_web1/utils/lorem_ipsum_generator.dart';
import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/utils/screen_dimensions.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_spin_widget.dart';
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
                        fontSize: responsiveFontSize(context, 80,
                            maxFontSize: 100, scalingFactor: 0.2),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                getScreenWidth(context) <= 701
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: (1 / 100) * getScreenWidth(context),
                        ),
                        child: Text(
                          generateLoremIpsum(100, context),
                          style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: responsiveFontSize(context, 9)),
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: (1 / 100) * getScreenWidth(context),
                              ),
                              child: Text(
                                generateLoremIpsum(100, context),
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 9)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: responsivePaddingSize(context, 20)),
                            child: SizedBox(
                              width: responsiveFontSize(
                                context,
                                100,
                                maxFontSize: 140,
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// class LargeAbout extends StatelessWidget {
//   const LargeAbout({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AnimatedFadeInWidget(
//                 slideDirection: SlideDirection.rightToLeft,
//                 startDelay: const Duration(milliseconds: 200),
//                 child: Text(
//                   'about me',
//                   style: TextStyle(
//                       fontSize: responsiveFontSize(context, 80,
//                           maxFontSize: 100, scalingFactor: 0.2),
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   vertical: (1 / 100) * getScreenWidth(context),
//                 ),
//                 child: Text(
//                   generateLoremIpsum(100),
//                   style: DefaultTextStyle.of(context)
//                       .style
//                       .copyWith(fontSize: responsiveFontSize(context, 9)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 vertical: (7 / 100) * getScreenWidth(context)),
//             child: AnimatedFadeInWidget(
//               startDelay: const Duration(milliseconds: 500),
//               child: AnimatedSpinWidget(
//                 endRotationDegree: 420,
//                 delayedStart: true,
//                 delayDuration: const Duration(milliseconds: 500),
//                 spinCurve: Curves.easeInOutCubic,
//                 child:
//                     //  SizedBox(
//                     //   height: responsiveFontSize(
//                     //     context,
//                     //     100,
//                     //     maxFontSize: 140,
//                     //   ),
//                     //   width: responsiveFontSize(
//                     //     context,
//                     //     100,
//                     //     maxFontSize: 140,
//                     //   ),
//                     // ),
//                     ClipOval(
//                   child: Image.asset(
//                     'assets/images/profile.jpg',
//                     width: responsiveFontSize(
//                       context,
//                       100,
//                       maxFontSize: 140,
//                     ),
//                     height: responsiveFontSize(
//                       context,
//                       100,
//                       maxFontSize: 140,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MediumAbout extends StatelessWidget {
//   const MediumAbout({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child:
//                       // TEXT2
//                       Padding(
//                     padding: EdgeInsets.symmetric(
//                       vertical: (1 / 100) * getScreenWidth(context),
//                     ),
//                     child: Text(
//                       generateLoremIpsum(100),
//                       style: DefaultTextStyle.of(context)
//                           .style
//                           .copyWith(fontSize: responsiveFontSize(context, 9)),
//                     ),
//                   ),
//                 ),
//                 // IMAGE
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: (7 / 100) * getScreenWidth(context)),
//                   child: AnimatedFadeInWidget(
//                     startDelay: const Duration(milliseconds: 500),
//                     child: AnimatedSpinWidget(
//                       endRotationDegree: 420,
//                       delayedStart: true,
//                       delayDuration: const Duration(milliseconds: 500),
//                       spinCurve: Curves.easeInOutCubic,
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/images/profile.jpg',
//                           width: responsiveFontSize(
//                             context,
//                             100,
//                             maxFontSize: 140,
//                           ),
//                           height: responsiveFontSize(
//                             context,
//                             100,
//                             maxFontSize: 140,
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // TEXT1
//             AnimatedFadeInWidget(
//               slideDirection: SlideDirection.rightToLeft,
//               startDelay: const Duration(milliseconds: 200),
//               child: Text(
//                 'about me',
//                 style: TextStyle(
//                     fontSize: responsiveFontSize(context, 80,
//                         maxFontSize: 100, scalingFactor: 0.2),
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
