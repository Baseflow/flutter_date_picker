import 'package:date_picker/src/date_picker_element.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  DateSelector({
    this.background,
    this.border,
    this.borderRadius,
    required this.date,
    required this.firstDate,
    this.icon,
    required this.lastDate,
    this.margin,
    this.onDateSelected,
    this.width,
  });

  final Color? background;
  final Border? border;
  final BorderRadius? borderRadius;
  final DateTime date;
  final DateTime firstDate;
  final Icon? icon;
  final DateTime lastDate;
  final EdgeInsets? margin;
  final ValueChanged<DateTime>? onDateSelected;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return DatePickerElement(
      background: background,
      border: border,
      borderRadius: borderRadius,
      child: Center(
        child: icon,
      ),
      date: date,
      margin: margin,
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: firstDate,
          lastDate: lastDate,
        );

        if (onDateSelected != null && selectedDate != null) {
          onDateSelected!(selectedDate);
        }
      },
      width: width,
    );
  }
}
