import 'package:flutter/material.dart';

ThemeData Dark = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff1A1A1A),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xff1A1A1A),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    labelStyle: TextStyle(fontSize: 16),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    labelPadding: EdgeInsets.only(bottom: 10),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
);
