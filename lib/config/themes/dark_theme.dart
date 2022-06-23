import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    accentColor: Colors.redAccent,
    primarySwatch: Colors.red,
    backgroundColor: Color(0xFF2C384A),

    // Define the default font family.
    fontFamily: "RobotoMono",

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 66.0, fontWeight: FontWeight.bold, color: Colors.red),
      headline3: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.normal, color: Colors.white60),
      headline4: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red),
      headline5: TextStyle(
          fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: TextStyle(fontSize: 14.0, color: Colors.white60),
      bodyText2:
          TextStyle(fontSize: 14.0, fontFamily: 'Roboto', color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity);
