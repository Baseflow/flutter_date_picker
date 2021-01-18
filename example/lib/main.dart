import 'package:date_picker/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getTheme(context),
      home: DatePickerExample(title: 'Date Picker Demo'),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  DatePickerExample({this.title});

  final String title;

  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final baseDate = DateTime.now();
    final defaultTextStyle = TextStyle(
      fontSize: 12,
    );
    final defaultSelectedTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: DatePicker(
              dateStyle: TextStyle(
                color: kDefaultTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              elementBackground: Colors.white,
              elementBorder: Border.all(
                color: kBorderColor,
                width: 1,
                style: BorderStyle.solid,
              ),
              elementBorderRadius: BorderRadius.circular(4),
              elementMargin: const EdgeInsets.only(left: 5, right: 5),
              elementWidth: 59,
              firstDate: DateTime(baseDate.year - 1, 1, 1),
              height: 66,
              monthStyle: defaultTextStyle,
              lastDate: DateTime(baseDate.year + 4, 1, 1),
              onDateSelected: (date) => setState(() => selectedDate = date),
              selectedDateStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              selectedElementBackground: Theme.of(context).primaryColor,
              selectedElementBorder: null,
              selectedMonthStyle: defaultSelectedTextStyle,
              selectedWeekDayStyle: defaultSelectedTextStyle,
              showDateSelector: true,
              showMonth: true,
              weekDayStyle: defaultTextStyle,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Selected date:'),
                Text(
                  DateFormat('dd-MM-yyyy').format(selectedDate),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const kPrimary = Color.fromRGBO(252, 171, 8, 1);
const kPrimaryDarker = Color.fromRGBO(182, 122, 2, 1);
const kOnPrimaryColor = Colors.white;

const kAccentColor = Color.fromRGBO(31, 48, 66, 1);
const kAccentColorDarker = Color.fromRGBO(19, 30, 41, 1);
const kOnAccentColor = Colors.white;

const kSecondaryColor = Color.fromRGBO(224, 224, 224, 1);
const kBackgroundColor = Color.fromRGBO(229, 236, 241, 1);
const kSurfaceColor = Color.fromRGBO(255, 255, 255, 1);
const kBorderColor = Color.fromRGBO(212, 224, 219, 1);
const kShadowColor = Color.fromRGBO(111, 129, 137, 0.2);

const kDefaultTextColor = kAccentColor;
const kDefaultIconColor = kAccentColor;

const kInputDecorationFillColor = Colors.white;

const kAnimalNumberBackgroundColor = Color.fromRGBO(247, 140, 0, 1);
const kOnAnimalNumberBackgroundColor = Colors.white;

ThemeData getTheme(BuildContext context) {
  final theme = Theme.of(context);

  final colorScheme = _getColorScheme();

  final textTheme = theme.textTheme.copyWith(
    headline6: theme.textTheme.headline6.copyWith(
      color: kDefaultTextColor,
    ),
    bodyText2: theme.textTheme.bodyText2.copyWith(
      color: kDefaultTextColor,
    ),
    button: theme.textTheme.bodyText2.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  return ThemeData(
    primaryColor: kPrimary,
    accentColor: kAccentColor,
    colorScheme: colorScheme,
    fontFamily: 'SF Pro Text',
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: textTheme,
    iconTheme: const IconThemeData.fallback().copyWith(
      color: kAccentColor,
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: kPrimary,
        labelStyle: TextStyle(
          color: kPrimary,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: kAccentColor,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
          color: kPrimary,
          width: 2.0,
        ))),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 10,
      textTheme: textTheme,
      iconTheme: const IconThemeData(
        color: kDefaultTextColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: kDefaultTextColor,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: const CardTheme(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        side: BorderSide(
          color: kBorderColor,
          width: 1,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide.none,
      ),
      fillColor: kInputDecorationFillColor,
      filled: true,
    ),
  );
}

ColorScheme _getColorScheme() {
  return ColorScheme(
    primary: kPrimary,
    primaryVariant: kPrimaryDarker,
    secondary: kAccentColor,
    secondaryVariant: kAccentColorDarker,
    surface: kSurfaceColor,
    background: kBackgroundColor,
    error: Colors.redAccent[700],
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: kDefaultTextColor,
    onBackground: kBackgroundColor,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}
