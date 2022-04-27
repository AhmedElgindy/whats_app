import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData normalMode = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: HexColor('#001313'),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#06141A'),
  ),
);

ThemeData darkMode = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1A1A1A),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xff1A1A1A),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    labelStyle: TextStyle(fontSize: 16),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    labelPadding: EdgeInsets.only(bottom: 10),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
);
