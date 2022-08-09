import 'package:flutter/material.dart';

class IndustrialTileSelectionProvider extends ChangeNotifier {

  int _selectedItem = -1;

  int get selectedItem => _selectedItem;

  changeSelection(int selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }

}