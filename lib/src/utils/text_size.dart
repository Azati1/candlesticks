import 'package:flutter/cupertino.dart';

class TextSize {
  static Size evaluate({
    String? text = '',
    required TextStyle style,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
