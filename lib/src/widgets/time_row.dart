import 'package:candlesticks/src/constant/view_constants.dart';
import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/models/candle_sticks_style.dart';
import 'package:candlesticks/src/widgets/abscissa_notation_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimeRow extends StatefulWidget {
  final List<Candle> candles;
  final double candleWidth;
  final DateTime? indicatorTime;
  final int index;
  final CandleSticksStyle style;
  final TextStyle? itemTextStyle;
  final Color? axisColor;

  const TimeRow({
    Key? key,
    required this.candles,
    required this.candleWidth,
    required this.indicatorTime,
    required this.index,
    required this.style,
    this.itemTextStyle,
    this.axisColor,
  }) : super(key: key);

  @override
  State<TimeRow> createState() => _TimeRowState();
}

class _TimeRowState extends State<TimeRow> {
  final ScrollController _scrollController = new ScrollController();

  /// Calculates number of candles between two time indicator
  int _stepCalculator() {
    if (widget.candleWidth < 3)
      return 31;
    else if (widget.candleWidth < 5)
      return 19;
    else if (widget.candleWidth < 7)
      return 13;
    else
      return 9;
  }

  /// Calculates [DateTime] of a given candle index
  DateTime _timeCalculator(int step, int index, Duration dif) {
    int candleNumber = (step + 1) ~/ 2 - 10 + index * step + -1;
    DateTime? _time;
    if (candleNumber < 0)
      _time = widget.candles[0].date
          .add(Duration(milliseconds: dif.inMilliseconds ~/ -1 * step * candleNumber));
    else if (candleNumber < widget.candles.length)
      _time = widget.candles[candleNumber].date;
    else {
      _time = widget.candles[0].date
          .subtract(Duration(milliseconds: dif.inMilliseconds ~/ step * candleNumber));
    }
    return _time;
  }

  @override
  void didUpdateWidget(TimeRow oldWidget) {
    if (oldWidget.index != widget.index || oldWidget.candleWidth != widget.candleWidth)
      _scrollController.jumpTo((widget.index + 10) * widget.candleWidth);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    int step = _stepCalculator();
    final dif = widget.candles[0].date.difference(widget.candles[1].date) * step;
    return SizedBox(
      height: 29.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: widget.axisColor ?? Colors.transparent, width: 1.5),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: math.max(widget.candles.length, 1000),
              scrollDirection: Axis.horizontal,
              itemExtent: step * widget.candleWidth,
              controller: _scrollController,
              reverse: true,
              itemBuilder: (context, index) {
                DateTime _time = _timeCalculator(step, index, dif);
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 0.05,
                        color: widget.style.borderColor,
                      ),
                    ),
                    AbscissaNotationItem(
                      difference: dif,
                      time: _time,
                      textColor: widget.style.primaryTextColor,
                      axisColor: widget.axisColor,
                      itemTextStyle: widget.itemTextStyle,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
