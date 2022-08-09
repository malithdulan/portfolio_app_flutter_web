import 'package:flutter/material.dart';

class IndustrialDescriptionChangeProvider extends ChangeNotifier {

  int _index = 0;

  int get index => _index;

  changeIndex(int index) {
    if (_index != index) {
      _index = index;
      notifyListeners();
    }
  }

}