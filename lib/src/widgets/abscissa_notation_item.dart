import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbscissaNotationItem extends StatelessWidget {
  const AbscissaNotationItem({
    Key? key,
    required this.textColor,
    required this.title,
    this.axisColor,
    this.itemTextStyle,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final Color? axisColor;
  final TextStyle? itemTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 13),
        _monthText(title, textColor),
      ],
    );
  }

  /// Day/month text widget
  Text _monthText(String title, Color color) {
    return Text(
      title,
      maxLines: 1,
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
