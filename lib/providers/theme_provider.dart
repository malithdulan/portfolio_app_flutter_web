import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  changeTheme(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

}