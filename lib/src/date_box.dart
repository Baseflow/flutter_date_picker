import 'package:date_picker/src/date_picker_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateBox extends StatelessWidget {
  DateBox({
    this.background,
    this.border,
    this.borderRadius,
    @required this.date,
    this.dateStyle,
    this.key,
    this.locale,
    this.margin,
    this.monthStyle,
    this.onPressed,
    this.showMonth,
    this.weekDayStyle,
    this.width,
  })  : assert(date != null),
        super(key: key);

  final Color background;
  final Border border;
  final BorderRadius borderRadius;
  final DateTime date;
  final TextStyle dateStyle;
  final Key key;
  final String locale;
  final EdgeInsets margin;
  final TextStyle monthStyle;
  final ValueChanged<DateTime> onPressed;
  final bool showMonth;
  final TextStyle weekDayStyle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return DatePickerElement(
      background: background,
      border: border,
      borderRadius: borderRadius,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('E', locale).format(date),
            style: weekDayStyle,
          ),
          Text(
            DateFormat('d', locale).format(date),
            style: dateStyle,
          ),
          if (showMonth)
            Text(
              DateFormat('MMM', locale).format(date),
              style: monthStyle,
            ),
        ],
      ),
      date: date,
      margin: margin,
      onPressed: () => onPressed(date),
      width: width,
    );
  }
}
