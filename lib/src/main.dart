import 'package:candlesticks/candlesticks.dart';
import 'package:candlesticks/src/models/main_window_indicator.dart';
import 'package:candlesticks/src/widgets/mobile_chart.dart';
import 'package:flutter/material.dart';

enum ChartAdjust {
  /// Will adjust chart size by max and min value from visible area
  visibleRange,

  /// Will adjust chart size by max and min value from the whole data
  fullRange
}

/// StatefulWidget that holds Chart's State (index of
/// current position and candles width).
class Candlesticks extends StatefulWidget {
  /// The arrangement of the array should be such that
  /// the newest item is in position 0
  final List<Candle> candles;

  /// How chart price range will be adjusted when moving chart
  final ChartAdjust chartAdjust;

  /// Custom loading widget
  final Widget? loadingWidget;

  final CandleSticksStyle? style;

  final TextStyle? ordinateItemTextStyle;

  final EdgeInsets? ordinateAxisPadding;

  final TextStyle? abscissaItemTextStyle;

  final Color? abscissaAxisColor;

  final Widget Function(Candle)? tooltipBuilder;

  const Candlesticks({
    Key? key,
    required this.candles,
    this.chartAdjust = ChartAdjust.visibleRange,
    this.loadingWidget,
    this.style,
    this.ordinateItemTextStyle,
    this.ordinateAxisPadding,
    this.abscissaItemTextStyle,
    this.abscissaAxisColor,
    this.tooltipBuilder,
  })  : assert(candles.length == 0 || candles.length > 1, "Please provide at least 2 candles"),
        super(key: key);

  @override
  _CandlesticksState createState() => _CandlesticksState();
}

class _CandlesticksState extends State<Candlesticks> {
  /// index of the newest candle to be displayed
  /// changes when user scrolls along the chart
  int index = 0;
  double lastX = 0;
  int lastIndex = -10;

  /// candleWidth controls the width of the single candles.
  ///  range: [2...10]
  double candleWidth = 6;

  MainWidnowDataContainer? mainWidnowDataContainer;

  @override
  void initState() {
    super.initState();
    if (widget.candles.length == 0) {
      return;
    }
    if (mainWidnowDataContainer == null) {
      mainWidnowDataContainer = MainWidnowDataContainer(widget.candles);
    }
  }

  @override
  void didUpdateWidget(covariant Candlesticks oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.candles.length == 0) {
      return;
    }
    if (mainWidnowDataContainer == null) {
      mainWidnowDataContainer = MainWidnowDataContainer(widget.candles);
    } else {
      mainWidnowDataContainer!.tickUpdate(widget.candles);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ??
        (Theme.of(context).brightness == Brightness.dark
            ? CandleSticksStyle.dark()
            : CandleSticksStyle.light());
    return Column(
      children: [
        if (widget.candles.length == 0 || mainWidnowDataContainer == null)
          Expanded(
            child: Center(
              child: widget.loadingWidget ?? CircularProgressIndicator(color: style.loadingColor),
            ),
          )
        else
          Expanded(
            child: TweenAnimationBuilder(
              tween: Tween(begin: 6.toDouble(), end: candleWidth),
              duration: Duration(milliseconds: 120),
              builder: (_, double width, __) {
                return MobileChart(
                  style: style,
                  mainWidnowDataContainer: mainWidnowDataContainer!,
                  chartAdjust: widget.chartAdjust,
                  onPanEnd: () {
                    lastIndex = index;
                  },
                  onPanDown: (double value) {
                    lastX = value;
                    lastIndex = index;
                  },
                  candleWidth: width,
                  candles: widget.candles,
                  index: index,
                  ordinateItemTextStyle: widget.ordinateItemTextStyle,
                  ordinateAxisPadding: widget.ordinateAxisPadding,
                  abscissaItemTextStyle: widget.abscissaItemTextStyle,
                  abscissaAxisColor: widget.abscissaAxisColor,
                  tooltipBuilder: widget.tooltipBuilder,
                );
              },
            ),
          ),
      ],
    );
  }
}
