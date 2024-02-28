import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blue,
    fontFamily: 'poppins',
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "poppins"),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black87,
    ));
