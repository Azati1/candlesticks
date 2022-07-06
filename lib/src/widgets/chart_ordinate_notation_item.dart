import 'package:flutter/material.dart';

class GraphicOrdinateNotationItem extends StatelessWidget {
  const GraphicOrdinateNotationItem({
    Key? key,
    required this.value,
    this.textStyle,
  }) : super(key: key);

  final double value;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toInt().toString(),
      style: textStyle ?? TextStyle(
        color: Colors.black,
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.left,
    );
  }
}
