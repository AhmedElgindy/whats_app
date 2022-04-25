import 'package:flutter/material.dart';

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
