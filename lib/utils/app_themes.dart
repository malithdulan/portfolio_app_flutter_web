import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(
      secondary: Colors.deepOrange,
      primary: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      secondary: Colors.deepOrange,
      primary: Colors.white,
    ),
      cardTheme: const CardTheme().copyWith(
          color: Colors.green.withOpacity(0.2),
      )
  );
}
