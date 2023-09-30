import 'package:bwc_web1/widgets/custom/on_hover_animated_text.dart';
import 'package:flutter/material.dart';

class AnimatedWordsInParagraph extends StatelessWidget {
  final String paragraph;
  final List<AnimatedWord> animatedWords;
  final TextStyle textStyle;

  const AnimatedWordsInParagraph({
    Key? key,
    required this.paragraph,
    required this.animatedWords,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: _buildTextSpans(),
      ),
    );
  }

  List<TextSpan> _buildTextSpans() {
    final List<TextSpan> textSpans = [];
    final List<String> words = paragraph.split(' ');

    int currentIndex = 0;
    while (currentIndex < words.length) {
      bool isAnimated = false;
      AnimatedWord? animatedWord;

      for (final aw in animatedWords) {
        if (aw.word.startsWith(words[currentIndex])) {
          isAnimated = true;
          animatedWord = aw;
          break;
        }
      }

      if (isAnimated && animatedWord != null) {
        final String word = animatedWord.word;
        final int wordLength = word.split(' ').length;

        textSpans.add(
          TextSpan(
            children: [
              WidgetSpan(
                child: GestureDetector(
                  onTap: animatedWord.onTap,
                  child: OnHoverAnimatedText(
                    text: word,
                    fontStyle: textStyle,
                    colors: animatedWord.colors,
                    onTap: animatedWord.onTap,
                    speed: animatedWord.speed,
                  ),
                ),
              ),
              if (currentIndex + wordLength < words.length - 1)
                const TextSpan(text: ' ')
            ],
          ),
        );

        currentIndex += wordLength;
      } else {
        textSpans.add(
          TextSpan(
            text: '${words[currentIndex]} ',
          ),
        );
        currentIndex++;
      }
    }

    return textSpans;
  }
}

class AnimatedWord {
  final String word;
  final List<Color> colors;
  final Duration? speed;
  final VoidCallback? onTap;

  AnimatedWord({
    required this.word,
    required this.colors,
    this.speed,
    this.onTap,
  });
}
