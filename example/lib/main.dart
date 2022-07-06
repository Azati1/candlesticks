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
    Candle(
        date: DateTime.now(),
        high: 20433.15,
        low: 20299.8,
        open: 20399.73,
        close: 20334.84,
        volume: 1577.78922),
    Candle(
        date: DateTime.now().add(Duration(hours: -1)),
        high: 20444.71,
        low: 20277.04,
        open: 20328.55,
        close: 20399.74,
        volume: 2240.114),
    Candle(
        date: DateTime.now().add(Duration(hours: -2)),
        high: 20478.08,
        low: 20277.75,
        open: 20383.37,
        close: 20328.55,
        volume: 2720.12559),
    Candle(
        date: DateTime.now().add(Duration(hours: -3)),
        high: 20448.19,
        low: 20185.85,
        open: 20266.09,
        close: 20383.36,
        volume: 5802.8288),
    Candle(
        date: DateTime.now().add(Duration(hours: -4)),
        high: 20396.72,
        low: 20234.37,
        open: 20301.85,
        close: 20266.09,
        volume: 2364.8641),
    Candle(
        date: DateTime.now().add(Duration(hours: -5)),
        high: 20328.16,
        low: 20133.55,
        open: 20148.85,
        close: 20301.84,
        volume: 2984.60375),
    Candle(
        date: DateTime.now().add(Duration(hours: -6)),
        high: 20200.98,
        low: 20059.01,
        open: 20198.56,
        close: 20148.86,
        volume: 2430.86193),
    Candle(
        date: DateTime.now().add(Duration(hours: -7)),
        high: 20297.25,
        low: 20102.36,
        open: 20228.35,
        close: 20198.56,
        volume: 4452.71413),
    Candle(
        date: DateTime.now().add(Duration(hours: -8)),
        high: 20366.2,
        low: 20042.85,
        open: 20154.77,
        close: 20228.36,
        volume: 6610.45749),
    Candle(
        date: DateTime.now().add(Duration(hours: -9)),
        high: 20185.21,
        low: 19961.02,
        open: 20103.44,
        close: 20154.77,
        volume: 3468.86551),
    Candle(
        date: DateTime.now().add(Duration(hours: -10)),
        high: 20159.43,
        low: 20033.37,
        open: 20133.0,
        close: 20103.43,
        volume: 2060.33199),
    Candle(
        date: DateTime.now().add(Duration(hours: -11)),
        high: 20220.0,
        low: 20045.0,
        open: 20202.76,
        close: 20132.99,
        volume: 2826.0788),
    Candle(
        date: DateTime.now().add(Duration(hours: -12)),
        high: 20285.76,
        low: 20121.76,
        open: 20184.36,
        close: 20202.75,
        volume: 2542.09717),
    Candle(
        date: DateTime.now().add(Duration(hours: -13)),
        high: 20303.65,
        low: 20085.93,
        open: 20162.21,
        close: 20184.57,
        volume: 3559.04955),
    Candle(
        date: DateTime.now().add(Duration(hours: -14)),
        high: 20243.83,
        low: 20080.46,
        open: 20089.67,
        close: 20162.22,
        volume: 3206.25585),
    Candle(
        date: DateTime.now().add(Duration(hours: -15)),
        high: 20100.0,
        low: 19864.45,
        open: 20048.08,
        close: 20089.67,
        volume: 2828.03781),
    Candle(
        date: DateTime.now().add(Duration(hours: -16)),
        high: 20195.59,
        low: 19909.53,
        open: 20098.75,
        close: 20048.08,
        volume: 3559.05978),
    Candle(
        date: DateTime.now().add(Duration(hours: -17)),
        high: 20337.84,
        low: 19895.72,
        open: 19951.47,
        close: 20098.75,
        volume: 5174.97219),
    Candle(
        date: DateTime.now().add(Duration(hours: -18)),
        high: 19985.68,
        low: 19761.25,
        open: 19860.6,
        close: 19951.47,
        volume: 2301.63459),
    Candle(
        date: DateTime.now().add(Duration(hours: -19)),
        high: 19977.18,
        low: 19796.92,
        open: 19877.48,
        close: 19860.6,
        volume: 2561.11119),
    Candle(
        date: DateTime.now().add(Duration(hours: -20)),
        high: 20314.28,
        low: 19828.71,
        open: 20261.89,
        close: 19877.48,
        volume: 4909.99636),
    Candle(
        date: DateTime.now().add(Duration(hours: -21)),
        high: 20414.01,
        low: 20087.02,
        open: 20175.84,
        close: 20261.88,
        volume: 3732.85185),
    Candle(
        date: DateTime.now().add(Duration(hours: -22)),
        high: 20435.99,
        low: 20103.05,
        open: 20435.24,
        close: 20175.83,
        volume: 2567.19952),
    Candle(
        date: DateTime.now().add(Duration(hours: -23)),
        high: 20439.99,
        low: 20252.38,
        open: 20373.12,
        close: 20435.25,
        volume: 2096.58841),
    Candle(
        date: DateTime.now().add(Duration(hours: -24)),
        high: 20495.62,
        low: 20175.0,
        open: 20458.93,
        close: 20373.12,
        volume: 4065.57125),
    Candle(
        date: DateTime.now().add(Duration(hours: -25)),
        high: 20750.0,
        low: 20361.34,
        open: 20398.21,
        close: 20458.93,
        volume: 8924.4921),
    Candle(
        date: DateTime.now().add(Duration(hours: -26)),
        high: 20500.0,
        low: 20063.29,
        open: 20117.49,
        close: 20398.21,
        volume: 7970.48056),
    Candle(
        date: DateTime.now().add(Duration(hours: -27)),
        high: 20142.6,
        low: 19673.12,
        open: 19703.85,
        close: 20117.5,
        volume: 4808.6052),
    Candle(
        date: DateTime.now().add(Duration(hours: -28)),
        high: 19788.0,
        low: 19543.79,
        open: 19552.41,
        close: 19703.85,
        volume: 3647.64295),
    Candle(
        date: DateTime.now().add(Duration(hours: -29)),
        high: 19715.06,
        low: 19479.53,
        open: 19519.98,
        close: 19552.4,
        volume: 4779.03021),
    Candle(
        date: DateTime.now().add(Duration(hours: -30)),
        high: 19540.0,
        low: 19322.04,
        open: 19464.52,
        close: 19519.98,
        volume: 4114.2244),
    Candle(
        date: DateTime.now().add(Duration(hours: -31)),
        high: 19594.52,
        low: 19375.0,
        open: 19403.34,
        close: 19464.53,
        volume: 4532.82601),
    Candle(
        date: DateTime.now().add(Duration(hours: -32)),
        high: 19536.27,
        low: 19304.4,
        open: 19373.74,
        close: 19403.35,
        volume: 5634.13406),
    Candle(
        date: DateTime.now().add(Duration(hours: -33)),
        high: 19545.45,
        low: 19359.0,
        open: 19520.4,
        close: 19373.75,
        volume: 5291.42411),
    Candle(
        date: DateTime.now().add(Duration(hours: -34)),
        high: 19808.46,
        low: 19478.0,
        open: 19740.94,
        close: 19520.39,
        volume: 3905.1814),
    Candle(
        date: DateTime.now().add(Duration(hours: -35)),
        high: 19821.95,
        low: 19700.39,
        open: 19770.3,
        close: 19740.94,
        volume: 2491.04195),
    Candle(
        date: DateTime.now().add(Duration(hours: -36)),
        high: 19936.62,
        low: 19636.86,
        open: 19894.93,
        close: 19770.3,
        volume: 4220.24693),
    Candle(
        date: DateTime.now().add(Duration(hours: -37)),
        high: 20215.69,
        low: 19802.87,
        open: 20215.68,
        close: 19894.92,
        volume: 5485.43869),
    Candle(
        date: DateTime.now().add(Duration(hours: -38)),
        high: 20397.88,
        low: 20177.0,
        open: 20387.82,
        close: 20215.69,
        volume: 2548.40051),
    Candle(
        date: DateTime.now().add(Duration(hours: -39)),
        high: 20437.86,
        low: 20291.18,
        open: 20296.3,
        close: 20387.81,
        volume: 1906.07562),
    Candle(
        date: DateTime.now().add(Duration(hours: -40)),
        high: 20470.78,
        low: 20226.95,
        open: 20272.39,
        close: 20296.3,
        volume: 4672.72436),
    Candle(
        date: DateTime.now().add(Duration(hours: -41)),
        high: 20316.45,
        low: 20183.8,
        open: 20312.99,
        close: 20272.38,
        volume: 1655.94889),
    Candle(
        date: DateTime.now().add(Duration(hours: -42)),
        high: 20318.0,
        low: 20173.86,
        open: 20173.87,
        close: 20312.98,
        volume: 1366.06218),
    Candle(
        date: DateTime.now().add(Duration(hours: -43)),
        high: 20299.99,
        low: 20159.59,
        open: 20299.14,
        close: 20173.87,
        volume: 1819.08109),
    Candle(
        date: DateTime.now().add(Duration(hours: -44)),
        high: 20423.45,
        low: 20249.65,
        open: 20395.6,
        close: 20299.14,
        volume: 2692.62216),
    Candle(
        date: DateTime.now().add(Duration(hours: -45)),
        high: 20478.4,
        low: 20179.74,
        open: 20236.71,
        close: 20395.59,
        volume: 4846.095),
    Candle(
        date: DateTime.now().add(Duration(hours: -46)),
        high: 20354.01,
        low: 20113.91,
        open: 20163.66,
        close: 20236.71,
        volume: 4871.46284),
    Candle(
        date: DateTime.now().add(Duration(hours: -47)),
        high: 20252.22,
        low: 19871.88,
        open: 19958.76,
        close: 20163.67,
        volume: 4841.72952),
    Candle(
        date: DateTime.now().add(Duration(hours: -48)),
        high: 20031.58,
        low: 19749.51,
        open: 19782.79,
        close: 19958.75,
        volume: 1935.62286),
    Candle(
        date: DateTime.now().add(Duration(hours: -49)),
        high: 19876.77,
        low: 19733.95,
        open: 19829.98,
        close: 19782.79,
        volume: 1669.25259),
    Candle(
        date: DateTime.now().add(Duration(hours: -50)),
        high: 19961.89,
        low: 19758.21,
        open: 19930.71,
        close: 19829.99,
        volume: 2284.23596),
    Candle(
        date: DateTime.now().add(Duration(hours: -51)),
        high: 19993.46,
        low: 19826.25,
        open: 19899.41,
        close: 19930.71,
        volume: 2352.43474),
    Candle(
        date: DateTime.now().add(Duration(hours: -52)),
        high: 20050.0,
        low: 19719.83,
        open: 19740.95,
        close: 19899.41,
        volume: 4666.76153),
    Candle(
        date: DateTime.now().add(Duration(hours: -53)),
        high: 19831.21,
        low: 19676.9,
        open: 19801.48,
        close: 19740.96,
        volume: 2788.42963),
    Candle(
        date: DateTime.now().add(Duration(hours: -54)),
        high: 20143.02,
        low: 19609.7,
        open: 19609.72,
        close: 19801.47,
        volume: 7620.56292),
    Candle(
        date: DateTime.now().add(Duration(hours: -55)),
        high: 19641.86,
        low: 19496.84,
        open: 19530.54,
        close: 19609.71,
        volume: 2880.24395),
    Candle(
        date: DateTime.now().add(Duration(hours: -56)),
        high: 19756.07,
        low: 19526.3,
        open: 19712.8,
        close: 19530.55,
        volume: 3696.2842),
    Candle(
        date: DateTime.now().add(Duration(hours: -57)),
        high: 19888.0,
        low: 19644.8,
        open: 19806.48,
        close: 19712.8,
        volume: 5787.91668),
    Candle(
        date: DateTime.now().add(Duration(hours: -58)),
        high: 19855.7,
        low: 19463.63,
        open: 19470.64,
        close: 19806.49,
        volume: 6575.38314),
    Candle(
        date: DateTime.now().add(Duration(hours: -59)),
        high: 19554.97,
        low: 19367.05,
        open: 19367.06,
        close: 19470.65,
        volume: 4752.88148),
    Candle(
        date: DateTime.now().add(Duration(hours: -60)),
        high: 19445.48,
        low: 19140.19,
        open: 19147.25,
        close: 19367.05,
        volume: 4510.71372),
    Candle(
        date: DateTime.now().add(Duration(hours: -61)),
        high: 19174.15,
        low: 19110.04,
        open: 19120.6,
        close: 19147.25,
        volume: 1260.2665),
    Candle(
        date: DateTime.now().add(Duration(hours: -62)),
        high: 19140.54,
        low: 19084.29,
        open: 19101.43,
        close: 19120.6,
        volume: 1461.55337),
    Candle(
        date: DateTime.now().add(Duration(hours: -63)),
        high: 19189.0,
        low: 19084.19,
        open: 19137.19,
        close: 19101.42,
        volume: 1296.50582),
    Candle(
        date: DateTime.now().add(Duration(hours: -64)),
        high: 19150.0,
        low: 19115.02,
        open: 19125.19,
        close: 19137.19,
        volume: 769.55275),
    Candle(
        date: DateTime.now().add(Duration(hours: -65)),
        high: 19145.94,
        low: 19082.92,
        open: 19103.54,
        close: 19125.19,
        volume: 1022.11358),
    Candle(
        date: DateTime.now().add(Duration(hours: -66)),
        high: 19130.5,
        low: 19055.31,
        open: 19072.49,
        close: 19103.54,
        volume: 1517.93206),
    Candle(
        date: DateTime.now().add(Duration(hours: -67)),
        high: 19235.14,
        low: 19058.58,
        open: 19226.59,
        close: 19072.49,
        volume: 1954.18566),
    Candle(
        date: DateTime.now().add(Duration(hours: -68)),
        high: 19270.23,
        low: 19140.01,
        open: 19263.4,
        close: 19226.6,
        volume: 2109.92149),
    Candle(
        date: DateTime.now().add(Duration(hours: -69)),
        high: 19343.43,
        low: 19216.29,
        open: 19315.83,
        close: 19263.4,
        volume: 2188.09902),
    Candle(
        date: DateTime.now().add(Duration(hours: -70)),
        high: 19340.59,
        low: 19213.58,
        open: 19299.99,
        close: 19315.83,
        volume: 1561.94248),
    Candle(
        date: DateTime.now().add(Duration(hours: -71)),
        high: 19379.84,
        low: 19231.38,
        open: 19300.92,
        close: 19299.99,
        volume: 1899.92465),
    Candle(
        date: DateTime.now().add(Duration(hours: -72)),
        high: 19469.57,
        low: 19265.0,
        open: 19445.44,
        close: 19300.92,
        volume: 1976.69145),
    Candle(
        date: DateTime.now().add(Duration(hours: -73)),
        high: 19647.63,
        low: 19414.89,
        open: 19492.15,
        close: 19445.43,
        volume: 4265.52263),
    Candle(
        date: DateTime.now().add(Duration(hours: -74)),
        high: 19565.05,
        low: 19224.88,
        open: 19236.73,
        close: 19492.16,
        volume: 3647.04707),
    Candle(
        date: DateTime.now().add(Duration(hours: -75)),
        high: 19299.0,
        low: 19182.64,
        open: 19221.76,
        close: 19236.74,
        volume: 1631.47903),
    Candle(
        date: DateTime.now().add(Duration(hours: -76)),
        high: 19247.38,
        low: 19114.35,
        open: 19157.24,
        close: 19221.77,
        volume: 1428.88593),
    Candle(
        date: DateTime.now().add(Duration(hours: -77)),
        high: 19200.0,
        low: 19011.66,
        open: 19046.78,
        close: 19157.23,
        volume: 2274.644),
    Candle(
        date: DateTime.now().add(Duration(hours: -78)),
        high: 19136.43,
        low: 19033.1,
        open: 19078.95,
        close: 19046.78,
        volume: 1440.97448),
    Candle(
        date: DateTime.now().add(Duration(hours: -79)),
        high: 19100.0,
        low: 18964.0,
        open: 18977.21,
        close: 19078.94,
        volume: 1266.1993),
    Candle(
        date: DateTime.now().add(Duration(hours: -80)),
        high: 19083.4,
        low: 18967.13,
        open: 19069.51,
        close: 18977.22,
        volume: 1784.73797),
    Candle(
        date: DateTime.now().add(Duration(hours: -81)),
        high: 19121.05,
        low: 18982.2,
        open: 19089.79,
        close: 19069.51,
        volume: 1663.33696),
    Candle(
        date: DateTime.now().add(Duration(hours: -82)),
        high: 19144.78,
        low: 19063.01,
        open: 19072.04,
        close: 19089.8,
        volume: 965.11724),
    Candle(
        date: DateTime.now().add(Duration(hours: -83)),
        high: 19119.28,
        low: 19028.19,
        open: 19042.26,
        close: 19072.03,
        volume: 1172.23853),
    Candle(
        date: DateTime.now().add(Duration(hours: -84)),
        high: 19079.11,
        low: 18955.42,
        open: 19014.89,
        close: 19042.27,
        volume: 1828.95332),
    Candle(
        date: DateTime.now().add(Duration(hours: -85)),
        high: 19155.44,
        low: 18930.19,
        open: 19139.75,
        close: 19014.88,
        volume: 2176.4002),
    Candle(
        date: DateTime.now().add(Duration(hours: -86)),
        high: 19160.21,
        low: 19091.84,
        open: 19150.0,
        close: 19139.74,
        volume: 1216.94462),
    Candle(
        date: DateTime.now().add(Duration(hours: -87)),
        high: 19245.58,
        low: 19033.73,
        open: 19043.59,
        close: 19150.0,
        volume: 2203.60653),
    Candle(
        date: DateTime.now().add(Duration(hours: -88)),
        high: 19400.0,
        low: 19030.0,
        open: 19263.58,
        close: 19043.6,
        volume: 5361.62808),
    Candle(
        date: DateTime.now().add(Duration(hours: -89)),
        high: 19325.94,
        low: 18781.0,
        open: 19264.29,
        close: 19263.59,
        volume: 7026.95705),
    Candle(
        date: DateTime.now().add(Duration(hours: -90)),
        high: 19307.42,
        low: 19238.0,
        open: 19261.42,
        close: 19264.29,
        volume: 930.41691),
    Candle(
        date: DateTime.now().add(Duration(hours: -91)),
        high: 19284.16,
        low: 19183.68,
        open: 19189.31,
        close: 19261.41,
        volume: 879.02716),
    Candle(
        date: DateTime.now().add(Duration(hours: -92)),
        high: 19259.92,
        low: 19174.06,
        open: 19246.54,
        close: 19189.31,
        volume: 1040.27),
    Candle(
        date: DateTime.now().add(Duration(hours: -93)),
        high: 19292.04,
        low: 19173.46,
        open: 19252.82,
        close: 19246.54,
        volume: 1444.52072),
    Candle(
        date: DateTime.now().add(Duration(hours: -94)),
        high: 19342.63,
        low: 19200.0,
        open: 19331.35,
        close: 19252.81,
        volume: 1145.93824),
    Candle(
        date: DateTime.now().add(Duration(hours: -95)),
        high: 19371.69,
        low: 19314.73,
        open: 19355.24,
        close: 19331.34,
        volume: 1046.94854),
    Candle(
        date: DateTime.now().add(Duration(hours: -96)),
        high: 19383.01,
        low: 19250.16,
        open: 19263.29,
        close: 19355.24,
        volume: 1350.63502),
    Candle(
        date: DateTime.now().add(Duration(hours: -97)),
        high: 19286.74,
        low: 19201.99,
        open: 19273.27,
        close: 19263.3,
        volume: 1054.92054),
    Candle(
        date: DateTime.now().add(Duration(hours: -98)),
        high: 19408.01,
        low: 19196.0,
        open: 19320.15,
        close: 19273.27,
        volume: 2209.18115),
    Candle(
        date: DateTime.now().add(Duration(hours: -99)),
        high: 19399.86,
        low: 19259.37,
        open: 19299.37,
        close: 19320.15,
        volume: 1699.88762),
    Candle(
        date: DateTime.now().add(Duration(hours: -100)),
        high: 19346.93,
        low: 19285.22,
        open: 19294.02,
        close: 19299.36,
        volume: 1321.99417),
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
                  //primaryBull:
                  ),
              ordinateAxisPadding: EdgeInsets.only(bottom: 20, left: 20),
              abscisaAxisColor: Colors.blue,
              abscisaItemTextStyle: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
