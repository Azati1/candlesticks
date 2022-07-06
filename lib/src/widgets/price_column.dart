import 'package:candlesticks/src/constant/view_constants.dart';
import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/models/candle_sticks_style.dart';
import 'package:candlesticks/src/utils/helper_functions.dart';
import 'package:candlesticks/src/widgets/chart_ordinate_notation_item.dart';
import 'package:flutter/material.dart';

class PriceColumn extends StatelessWidget {
  const PriceColumn({
    Key? key,
    required this.ordinateMin,
    required this.ordinateMax,
    this.textStyle,
  }) : super(key: key);

  final double ordinateMin;
  final double ordinateMax;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final difference = ordinateMax - ordinateMin;
    final step = difference / 6;
    final values = List.generate(6, (index) => ordinateMax - step * index);

    return IgnorePointer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: values
            .map(
              (e) => GraphicOrdinateNotationItem(
                value: e,
                textStyle: textStyle,
              ),
            )
            .toList(),
      ),
    );
  }
}
