import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbscissaNotationItem extends StatelessWidget {
  const AbscissaNotationItem({
    Key? key,
    required this.difference,
    required this.time,
    required this.textColor,
    this.axisColor,
    this.itemTextStyle,
  }) : super(key: key);

  final Duration difference;
  final DateTime time;
  final Color textColor;
  final Color? axisColor;
  final TextStyle? itemTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 8, width: 2, color: axisColor),
        const SizedBox(height: 5),
        _monthText(time, textColor),
      ],
    );
  }

  /// Day/month text widget
  Text _monthDayText(DateTime _time, Color color) {
    return Text(
      numberFormat(_time.month) + "/" + numberFormat(_time.day),
      style: itemTextStyle ??
          TextStyle(
            color: color,
            fontSize: 12,
          ),
    );
  }

  /// Day/month text widget
  Text _monthText(DateTime _time, Color color) {
    return Text(
      DateFormat('MMM').format(_time),
      style: itemTextStyle ??
          TextStyle(
            color: color,
            fontSize: 12,
          ),
    );
  }

  /// Hour/minute text widget
  Text _hourMinuteText(DateTime _time, Color color) {
    return Text(
      numberFormat(_time.hour) + ":" + numberFormat(_time.minute),
      style: itemTextStyle ??
          TextStyle(
            color: color,
            fontSize: 12,
          ),
    );
  }

  /// Fomats number as 2 digit integer
  String numberFormat(int value) {
    return "${value < 10 ? 0 : ""}$value";
  }

  String dateFormatter(DateTime date) {
    return "${date.year}-${numberFormat(date.month)}-${numberFormat(date.day)} ${numberFormat(date.hour)}:${numberFormat(date.minute)}";
  }
}
