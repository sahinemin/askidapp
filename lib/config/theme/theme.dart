import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  final _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
    canvasColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.orange;
          }
          return Colors.black;
        }),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(),
    ),
  );
  final _darkTheme = ThemeData.dark();

  ThemeData get getLightTheme => _lightTheme;
  ThemeData get getDarkTheme => _darkTheme;
}
