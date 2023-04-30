import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  final themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    canvasColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
        textStyle:
            MaterialStatePropertyAll(TextStyle(foreground: Paint()..color)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.5),
      ),
    ),
  );
}
