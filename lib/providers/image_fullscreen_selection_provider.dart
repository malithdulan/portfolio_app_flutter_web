import 'package:flutter/material.dart';

class ImageFullscreenSelectionProvider extends ChangeNotifier {

  bool _isSelected = false;
  String? _imageUrl = "";

  bool get isSelected => _isSelected;
  String? get imageUrl => _imageUrl;

  changeSelection({bool? isSelected, String? url}) {
    if (_isSelected != isSelected) {
      _isSelected = isSelected ?? false;
      _imageUrl = url;
      notifyListeners();
    }
  }

}