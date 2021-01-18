import 'package:flutter/material.dart';

import 'date_box.dart';
import 'date_selector.dart';

class DatePicker extends StatefulWidget {
  DatePicker({
    this.dateStyle,
    this.elementBackground,
    this.elementBorder,
    this.elementBorderRadius,
    this.elementMargin,
    this.elementWidth,
    @required this.firstDate,
    this.height,
    @required this.lastDate,
    this.locale = 'en_US',
    this.monthStyle,
    this.onDateSelected,
    DateTime selectedDate,
    this.selectedDateStyle,
    this.selectedElementBackground,
    this.selectedElementBorder,
    this.selectedMonthStyle,
    this.selectedWeekDayStyle,
    this.showDateSelector = false,
    this.showMonth = false,
    this.weekDayStyle,
    this.width,
  })  : assert(firstDate != null),
        assert(lastDate != null),
        selectedDate = (selectedDate != null)
            ? DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
            : _defaultDate();

  final TextStyle dateStyle;
  final Color elementBackground;
  final Border elementBorder;
  final BorderRadius elementBorderRadius;
  final EdgeInsets elementMargin;
  final double elementWidth;
  final DateTime firstDate;
  final double height;
  final DateTime lastDate;
  final String locale;
  final TextStyle monthStyle;
  final ValueChanged<DateTime> onDateSelected;
  final DateTime selectedDate;
  final TextStyle selectedDateStyle;
  final TextStyle selectedMonthStyle;
  final TextStyle selectedWeekDayStyle;
  final Color selectedElementBackground;
  final Border selectedElementBorder;
  final bool showDateSelector;
  final bool showMonth;
  final TextStyle weekDayStyle;
  final double width;

  @override
  _DatePickerState createState() => _DatePickerState(selectedDate);

  static DateTime _defaultDate() {
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}

class _DatePickerState extends State<DatePicker> {
  _DatePickerState(this.selectedDate);

  final _scrollController = ScrollController();

  DateTime selectedDate;
  List<DateTime> _dates;

  @override
  void initState() {
    super.initState();

    final start = widget.firstDate;
    final end = widget.lastDate;

    final daysToGenerate = end.difference(start).inDays;
    _dates = List.generate(daysToGenerate,
        (i) => DateTime(start.year, start.month, start.day + (i)));

    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _animateToSelected());
  }

  @override
  Widget build(BuildContext context) {
    final scrollView = CustomScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildDateBox(context, _dates[index]),
            childCount: _dates.length,
          ),
        ),
      ],
    );

    return Container(
      height: widget.height,
      width: widget.width,
      child: widget.showDateSelector
          ? _wrapWithDateSelector(scrollView)
          : scrollView,
    );
  }

  Widget _buildDateBox(BuildContext context, DateTime date) {
    var weekDayStyle = widget.weekDayStyle;
    var background = widget.elementBackground;
    var border = widget.elementBorder;
    var dateStyle = widget.dateStyle;
    var monthStyle = widget.monthStyle;

    if (date == selectedDate) {
      weekDayStyle = widget.selectedWeekDayStyle;
      background = widget.selectedElementBackground;
      border = widget.selectedElementBorder;
      dateStyle = widget.selectedDateStyle;
      monthStyle = widget.selectedMonthStyle;
    }

    return DateBox(
      background: background,
      border: border,
      borderRadius: widget.elementBorderRadius,
      date: date,
      dateStyle: dateStyle,
      key: ValueKey('DateBox_${date.toIso8601String()}'),
      margin: widget.elementMargin,
      monthStyle: monthStyle,
      onPressed: (date) {
        selectedDate = date;
        _animateToSelected();

        setState(() {});

        if (widget.onDateSelected != null) {
          widget.onDateSelected(date);
        }
      },
      showMonth: widget.showMonth,
      width: widget.elementWidth,
      weekDayStyle: weekDayStyle,
    );
  }

  void _animateToSelected() {
    final index = _dates.indexOf(selectedDate);
    var offset = (widget.elementWidth +
            widget.elementMargin.left +
            widget.elementMargin.right) *
        index;

    if (offset > _scrollController.position.maxScrollExtent) {
      offset = _scrollController.position.maxScrollExtent;
    }

    _scrollController.animateTo(offset,
        duration: Duration(milliseconds: 350), curve: Curves.easeOut);
  }

  Widget _wrapWithDateSelector(Widget child) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: child,
        ),
        _dateSelector(),
      ],
    );
  }

  Widget _dateSelector() {
    return DateSelector(
      background: widget.elementBackground,
      border: widget.elementBorder,
      borderRadius: widget.elementBorderRadius,
      date: selectedDate,
      firstDate: widget.firstDate,
      icon: Icon(Icons.date_range),
      lastDate: widget.lastDate,
      margin: widget.elementMargin,
      onDateSelected: (date) {
        if (date == null) {
          return;
        }

        selectedDate = date;
        _animateToSelected();

        setState(() {});

        if (widget.onDateSelected != null) {
          widget.onDateSelected(date);
        }
      },
      width: widget.elementWidth,
    );
  }
}
