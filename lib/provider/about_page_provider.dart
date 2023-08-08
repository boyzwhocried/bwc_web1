import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextLineChangesNotifier extends ChangeNotifier {
  int _numLines = 0;

  int get numLines => _numLines;

  void updateNumLines(int newNumLines) {
    if (_numLines != newNumLines) {
      _numLines = newNumLines;
      notifyListeners();
    }
  }
}

class OnTextLineChangesProvider extends StatelessWidget {
  const OnTextLineChangesProvider({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final renderBox = context.findRenderObject() as RenderBox;
        final textHeight = renderBox.size.height;
        final numLines = ((textHeight / style.fontSize!).ceil()) - 1;

        final textLineChangesNotifier =
            Provider.of<TextLineChangesNotifier>(context, listen: false);
        textLineChangesNotifier.updateNumLines(numLines);

        return Text(
          text,
          style: style,
        );
      },
    );
  }
}