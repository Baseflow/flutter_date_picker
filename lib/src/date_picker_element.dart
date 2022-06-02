import 'package:flutter/material.dart';

class DatePickerElement extends StatelessWidget {
  DatePickerElement({
    this.background,
    this.border,
    this.borderRadius,
    this.child,
    required this.date,
    this.key,
    this.margin,
    this.onPressed,
    this.width,
  }) : super(key: key);

  final Color? background;
  final Border? border;
  final BorderRadius? borderRadius;
  final Widget? child;
  final DateTime date;
  final Key? key;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius,
            color: background,
          ),
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
