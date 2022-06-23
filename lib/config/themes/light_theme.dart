import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.red,
    accentColor: Colors.white10,
    primarySwatch: Colors.red,

    // Define the default font family.
    fontFamily: "RobotoMono",

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(
          fontSize: 66.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline3: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.normal, color: Colors.black54),
      headline4: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red),
      headline5: TextStyle(
          fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black87),
      headline6: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87),
      bodyText1: TextStyle(fontSize: 14.0, color: Colors.black54),
      bodyText2:
          TextStyle(fontSize: 14.0, fontFamily: 'Roboto', color: Colors.black),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity);
