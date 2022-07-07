import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/models/candle_sticks_style.dart';
import 'package:candlesticks/src/widgets/abscissa_notation_item.dart';
import 'package:flutter/material.dart';

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
    final visibleIndexes = _visibleIndexes();
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
            child: Stack(
              children: List.generate(widget.candles.sublist(0, candlesOnScreen).length, (index) {
                if (visibleIndexes.contains(index)) {
                  return Positioned(
                    right: index * widget.candleWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 0.05,
                          color: widget.style.borderColor,
                        ),
                        AbscissaNotationItem(
                          difference: dif,
                          time: widget.candles[index].date,
                          textColor: widget.style.primaryTextColor,
                          axisColor: widget.axisColor,
                          itemTextStyle: widget.itemTextStyle,
                        ),
                      ],
                    ),
                  );
                }
                return Positioned(
                  right: index * widget.candleWidth,
                  child: SizedBox(
                    width: widget.candleWidth,
                  ),
                );
              }).reversed.toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<int> _visibleIndexes() {
    final months = widget.candles.sublist(0, candlesOnScreen).map((e) => e.date.month).toList();

    final indexes = <int>[];
    print(months);

    for (int i = 0; i < months.length; i++) {
      final month = months[i];
      if (i < 2) continue;
      final previousMonth = months[i - 1];
      if (previousMonth != month) {
        indexes.add(i - 2);
      }
    }

    print(indexes);

    return indexes;
  }

  int get candlesOnScreen {
    return MediaQuery.of(context).size.width ~/ widget.candleWidth;
  }
}
