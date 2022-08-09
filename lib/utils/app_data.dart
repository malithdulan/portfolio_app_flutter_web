import 'package:flutter/material.dart';

class AppData {
  //singleton implementation
  AppData._privateConstructor(); //private constructor
  static AppData? _shared; //shared instance
  static AppData get shared {
    _shared ??= AppData._privateConstructor();
    return _shared!;
  }

  late double height;
  late double width;
  ThemeMode mode = ThemeMode.light;

  void setThemeMode(ThemeMode mode) {
    mode = mode;
  }

  void setDeviceValues(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    height = deviceSize.height;
    width = deviceSize.width;
  }
}