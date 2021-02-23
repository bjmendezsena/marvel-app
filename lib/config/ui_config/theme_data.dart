part of 'ui_config.dart';

ThemeData getThemeData() {
  return ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18),
        bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25)),
    primaryColor: colorsConfig[PRIMARY_COLOR],
    backgroundColor: colorsConfig[BACKGROUND_COLOR],
  );
}
