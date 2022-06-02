import 'package:date_picker/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getTheme(context),
      home: const DatePickerExample(title: 'Date Picker Demo'),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final baseDate = DateTime.now();
    const defaultTextStyle = TextStyle(
      fontSize: 12,
    );
    const defaultSelectedTextStyle = TextStyle(
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
              dateStyle: const TextStyle(
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
              firstDate: DateTime(baseDate.year - 1, 1, 1),
              monthStyle: defaultTextStyle,
              lastDate: DateTime(baseDate.year + 4, 1, 1),
              onDateSelected: (date) => setState(() => selectedDate = date),
              selectedDateStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              selectedElementBackground: Theme.of(context).primaryColor,
              selectedMonthStyle: defaultSelectedTextStyle,
              selectedWeekDayStyle: defaultSelectedTextStyle,
              showDateSelector: true,
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
                const Text('Selected date:'),
                Text(
                  DateFormat('dd-MM-yyyy').format(selectedDate),
                  style: const TextStyle(
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
    headline6: theme.textTheme.headline6!.copyWith(
      color: kDefaultTextColor,
    ),
    bodyText2: theme.textTheme.bodyText2!.copyWith(
      color: kDefaultTextColor,
    ),
    button: theme.textTheme.bodyText2!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  return ThemeData(
    primaryColor: kPrimary,
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
      iconTheme: const IconThemeData(
        color: kDefaultTextColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: kDefaultTextColor,
      ),
      toolbarTextStyle: textTheme.bodyText2,
      titleTextStyle: textTheme.headline6,
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
    colorScheme: colorScheme.copyWith(secondary: kAccentColor),
  );
}

ColorScheme _getColorScheme() {
  return ColorScheme(
    primary: kPrimary,
    secondary: kAccentColor,
    surface: kSurfaceColor,
    background: kBackgroundColor,
    error: Colors.redAccent[700]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: kDefaultTextColor,
    onBackground: kBackgroundColor,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}
