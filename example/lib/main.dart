import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';

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
    /*Candle(
      date: DateTime.now(),
      high: 6.2,
      low: 6.14,
      open: 6.16,
      close: 6.19,
      volume: 0,
    ),
    Candle(
      open: 7.01,
      close: 7.05,
      high: 7.07,
      low: 7.01,
      date: DateTime.now().add(Duration(hours: -1)),
      volume: 0,
    ),
    Candle(
      date: DateTime.now().add(Duration(hours: -2)),
      high: 7.03,
      low: 6.9,
      open: 6.9,
      close: 7.01,
      volume: 0,
    ),
    Candle(
      open: 7.01,
      close: 7.05,
      high: 7.07,
      low: 7.01,
      date: DateTime.now().add(Duration(hours: -3)),
      volume: 0,
    ),
    Candle(
      open: 17.01,
      close: 7.05,
      high: 17.07,
      low: 17.01,
      date: DateTime.now().add(Duration(hours: -4)),
      volume: 0,
    ),
    Candle(
      open: 27.01,
      close: 7.05,
      high: 27.07,
      low: 27.01,
      date: DateTime.now().add(Duration(hours: -5)),
      volume: 0,
    ),*/
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
            ),
          ),
        ),
      ),
    );
  }
}
