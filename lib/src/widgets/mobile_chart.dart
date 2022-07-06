import 'dart:math';
import 'package:candlesticks/candlesticks.dart';
import 'package:candlesticks/src/constant/view_constants.dart';
import 'package:candlesticks/src/models/main_window_indicator.dart';
import 'package:candlesticks/src/widgets/candle_stick_widget.dart';
import 'package:candlesticks/src/widgets/price_column.dart';
import 'package:candlesticks/src/widgets/time_row.dart';
import 'package:flutter/material.dart';

/// This widget manages gestures
/// Calculates the highest and lowest price of visible candles.
/// Updates right-hand side numbers.
/// And pass values down to [CandleStickWidget].
class MobileChart extends StatefulWidget {
  /// candleWidth controls the width of the single candles.
  /// range: [2...10]
  final double candleWidth;

  /// list of all candles to display in chart
  final List<Candle> candles;

  /// index of the newest candle to be displayed
  /// changes when user scrolls along the chart
  final int index;

  /// holds main window indicators data and high and low prices.
  final MainWidnowDataContainer mainWidnowDataContainer;

  /// How chart price range will be adjusted when moving chart
  final ChartAdjust chartAdjust;

  final CandleSticksStyle style;

  final void Function(double) onPanDown;

  final void Function() onPanEnd;

  final TextStyle? ordinateItemTextStyle;

  final EdgeInsets? ordinateAxisPadding;

  final TextStyle? abscisaItemTextStyle;

  final Color? abscisaAxisColor;

  final Function(Candle)? onCandleSelected;

  MobileChart({
    required this.style,
    required this.candleWidth,
    required this.candles,
    required this.index,
    required this.chartAdjust,
    required this.onPanDown,
    required this.onPanEnd,
    required this.mainWidnowDataContainer,
    this.ordinateItemTextStyle,
    this.ordinateAxisPadding,
    this.abscisaItemTextStyle,
    this.abscisaAxisColor,
    this.onCandleSelected,
  });

  @override
  State<MobileChart> createState() => _MobileChartState();
}

class _MobileChartState extends State<MobileChart> {
  double? longPressX;
  double? longPressY;
  bool showIndicatorNames = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // determine charts width and height
        final double maxWidth = constraints.maxWidth;
        final double maxHeight = constraints.maxHeight - DATE_BAR_HEIGHT;

        // visible candles start and end indexes
        final int candlesStartIndex = max(widget.index, 0);
        final int candlesEndIndex =
            min(maxWidth ~/ widget.candleWidth + widget.index, widget.candles.length - 1);

        double candlesHighPrice = 0;
        double candlesLowPrice = 0;
        if (widget.chartAdjust == ChartAdjust.visibleRange) {
          candlesHighPrice = widget.mainWidnowDataContainer.highs
              .getRange(candlesStartIndex, candlesEndIndex + 1)
              .reduce(max);
          candlesLowPrice = widget.mainWidnowDataContainer.lows
              .getRange(candlesStartIndex, candlesEndIndex + 1)
              .reduce(min);
        } else if (widget.chartAdjust == ChartAdjust.fullRange) {
          candlesHighPrice = widget.mainWidnowDataContainer.highs.reduce(max);
          candlesLowPrice = widget.mainWidnowDataContainer.lows.reduce(min);
        }

        if (longPressX != null && longPressY != null) {
          longPressX = max(longPressX!, 0);
          longPressX = min(longPressX!, maxWidth);
          longPressY = max(longPressY!, 0);
          longPressY = min(longPressX!, maxHeight);
        }

        return TweenAnimationBuilder(
          tween: Tween(begin: candlesHighPrice, end: candlesHighPrice),
          duration: Duration(milliseconds: 0),
          builder: (context, double high, _) {
            return TweenAnimationBuilder(
              tween: Tween(begin: candlesLowPrice, end: candlesLowPrice),
              duration: Duration(milliseconds: 0),
              builder: (context, double low, _) {
                final currentCandle = longPressX == null
                    ? null
                    : widget.candles[min(
                        max((maxWidth - longPressX!) ~/ widget.candleWidth + widget.index, 0),
                        widget.candles.length - 1)];

                if (currentCandle != null) {
                  widget.onCandleSelected?.call(currentCandle);
                }

                return Container(
                  color: widget.style.background,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: widget.ordinateAxisPadding?.left ?? 0,
                                  top: widget.ordinateAxisPadding?.top ?? 0,
                                  bottom: widget.ordinateAxisPadding?.bottom ?? 0,
                                  child: PriceColumn(
                                    ordinateMin: candlesLowPrice,
                                    ordinateMax: candlesHighPrice,
                                    textStyle: widget.ordinateItemTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: RepaintBoundary(
                                    child: CandleStickWidget(
                                      candles: widget.candles,
                                      candleWidth: widget.candleWidth,
                                      index: widget.index,
                                      high: high,
                                      low: low,
                                      bearColor: widget.style.primaryBear,
                                      bullColor: widget.style.primaryBull,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TimeRow(
                            style: widget.style,
                            candles: widget.candles,
                            candleWidth: widget.candleWidth,
                            indicatorTime: currentCandle?.date,
                            index: widget.index,
                            itemTextStyle: widget.abscisaItemTextStyle,
                            axisColor: widget.abscisaAxisColor,
                          ),
                        ],
                      ),
                      longPressX != null
                          ? Positioned(
                              child: Container(
                                width: 1,
                                height: maxHeight - 8,
                                color: widget.style.mobileCandleHoverColor,
                              ),
                              right: (maxWidth - longPressX!),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onLongPressEnd: (_) {
                            setState(() {
                              longPressX = null;
                              longPressY = null;
                            });
                          },
                          onLongPressStart: (LongPressStartDetails details) {
                            setState(() {
                              longPressX = details.localPosition.dx;
                              longPressY = details.localPosition.dy;
                            });
                          },
                          behavior: HitTestBehavior.translucent,
                          onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
                            setState(() {
                              longPressX = details.localPosition.dx;
                              longPressY = details.localPosition.dy;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
