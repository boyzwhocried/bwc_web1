import 'package:bwc_web1/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

import 'on_hover_animated_text.dart';

class AnimatedWordsInParagraph extends StatelessWidget {
  final String paragraph;
  final List<AnimatedWord> animatedWords;
  final TextStyle textStyle;
  // final VoidCallback? onTap;

  const AnimatedWordsInParagraph({
    super.key,
    required this.paragraph,
    required this.animatedWords,
    required this.textStyle,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: responsiveFontSize(context, 9),
            ),
        children: _buildTextSpans(context),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(BuildContext context) {
    List<TextSpan> textSpans = [];
    final words = paragraph.split(' ');

    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      bool isAnimated = false;
      AnimatedWord? animatedWord;

      for (final aw in animatedWords) {
        if (aw.word.contains(word)) {
          isAnimated = true;
          animatedWord = aw;
          break;
        }
      }

      if (isAnimated && animatedWord != null) {
        final wordIndex = animatedWord.word.indexOf(word);

        if (wordIndex == 0) {
          textSpans.add(
            TextSpan(
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: animatedWord.onTap,
                    child: OnHoverAnimatedText(
                      text: animatedWord.word,
                      fontStyle: textStyle,
                      colors: animatedWord.colors,
                      // onTap: animatedWord.onTap,
                    ),
                  ),
                ),
                if (i < words.length - 1) const TextSpan(text: ' ')
              ],
            ),
          );
        }

        /* else {
          textSpans.add(
            TextSpan(text: '$word${i < words.length - 1 ? ' ' : ''}'),
          );
        } */

        // textSpans.add(
        //   TextSpan(
        //     children: [
        //       WidgetSpan(
        //         child: GestureDetector(
        //           onTap: animatedWord.onTap,
        //           child: OnHoverAnimatedText(
        //             text: word,
        //             fontStyle: textStyle,
        //             colors: animatedWord.colors,
        //           ),
        //         ),
        //       ),
        //       if (i < words.length - 1) const TextSpan(text: ' ')
        //     ],
        //   ),
        // );
      } else {
        textSpans.add(
          TextSpan(text: '$word${i < words.length - 1 ? ' ' : ''}'),
        );
      }
    }

    return textSpans;
  }
}

class AnimatedWord {
  final String word;
  final List<Color> colors;
  final VoidCallback onTap;

  AnimatedWord({
    required this.word,
    required this.colors,
    required this.onTap,
  });
}
