import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:bwc_web1/utils/responsive_padding_size.dart';
import 'package:bwc_web1/widgets/contents/introduction.dart';
import 'package:bwc_web1/widgets/custom/custom_animated_fade_in_widget.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({
    super.key,
    required this.updateCallback,
  });

  final Function(int) updateCallback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(responsivePaddingSize(context, 12)),
        child: Column(
          children: [
            const IntroductionSection(),
            Padding(
              padding: EdgeInsets.only(
                top: responsivePaddingSize(context, 5),
              ),
              child: AnimatedFadeInWidget(
                startDelay: const Duration(milliseconds: 500),
                child: TextButton(
                  onPressed: () {
                    updateCallback(1);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(responsivePaddingSize(context, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            updateCallback(1);
                          },
                          child: Text(
                            'go explore',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w600,
                              fontSize: responsiveFontSize(context, 16),
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color
                                  ?.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: responsiveFontSize(context, 32),
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color
                              ?.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
