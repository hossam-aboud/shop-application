import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/styles/color.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
    backgroundColor: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: Color(0xFF000000),
      fontSize: 20.0,
    ),
  ),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    actionsIconTheme: IconThemeData(
      color: Color(0xFF000000),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF000000),
    ),
    titleTextStyle: const TextStyle(
      color: Color(0xFF000000),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
      fontSize: 20.0,
    ),
  ),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    actionsIconTheme: IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
    titleTextStyle: const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
