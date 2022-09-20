import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Candle> candles = [
    Candle(
      date: DateTime(2020),
      high: 6.2,
      low: 6.14,
      open: 6.16,
      close: 6.19,
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 7.01,
      close: 7.05,
      high: 7.07,
      low: 7.01,
      date: DateTime(2020).add(Duration(minutes: -15)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      date: DateTime(2020).add(Duration(minutes: -30)),
      high: 7.03,
      low: 6.9,
      open: 6.9,
      close: 7.01,
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 7.01,
      close: 7.05,
      high: 7.07,
      low: 7.01,
      date: DateTime(2020).add(Duration(minutes: -45)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 17.01,
      close: 7.05,
      high: 17.07,
      low: 17.01,
      date: DateTime(2020).add(Duration(minutes: -60)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 27.01,
      close: 7.05,
      high: 27.07,
      low: 27.01,
      date: DateTime(2020).add(Duration(minutes: -75)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 27.01,
      close: 7.05,
      high: 27.07,
      low: 27.01,
      date: DateTime(2020).add(Duration(minutes: -90)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 27.01,
      close: 7.05,
      high: 27.07,
      low: 27.01,
      date: DateTime(2020).add(Duration(minutes: -105)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
    Candle(
      open: 27.01,
      close: 7.05,
      high: 27.07,
      low: 27.01,
      date: DateTime(2020).add(Duration(minutes: -120)),
      volume: 0,
      change: 0,
      amplitude: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            height: 300,
            child: Candlesticks(
              candles: candles,
              style: CandleSticksStyle.dark(
                primaryBull: Colors.blue,
              ),
              ordinateAxisPadding: EdgeInsets.only(bottom: 20, left: 20),
              abscissaAxisColor: Colors.blue,
              abscissaItemTextStyle:
                  TextStyle(color: Colors.blue, fontSize: 12),
              tooltipBuilder: (candle) => Container(
                color: Colors.blue,
                child: Text('qw'),
              ),
              isPrimary: (prev, date, next) {
                return date.minute == 0;
              },
              dateBuilder: (date) {
                return 'text';
              },
            ),
          ),
        ),
      ),
    );
  }
}
