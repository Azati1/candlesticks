import 'package:candlesticks/src/models/indicator.dart';
import 'dart:math' as math;
import 'candle.dart';
import 'package:flutter/material.dart';

class MainWidnowDataContainer {
  List<double> highs = [];
  List<double> lows = [];
  late DateTime beginDate;
  late DateTime endDate;

  MainWidnowDataContainer(List<Candle> candles) {
    endDate = candles[0].date;
    beginDate = candles.last.date;

    highs = candles.map((e) => e.high).toList();
    lows = candles.map((e) => e.low).toList();
  }

  void tickUpdate(List<Candle> candles) {
    // update last candles
    for (int i = 0; candles[i].date.compareTo(endDate) > 0; i++) {
      highs.insert(i, candles[i].high);
      lows.insert(i, candles[i].low);
    }

    endDate = candles[0].date;

    // update prev candles
    int firstCandleIndex = 0;
    for (int i = candles.length - 1; i >= 0; i--) {
      if (candles[i].date == beginDate) {
        firstCandleIndex = i;
        break;
      }
    }
    for (int i = firstCandleIndex + 1; i < candles.length; i++) {
      highs.add(candles[i].high);
      lows.add(candles[i].low);
    }
    beginDate = candles.last.date;
  }
}
