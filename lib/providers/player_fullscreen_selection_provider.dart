import 'package:flutter/material.dart';

class PlayerFullscreenSelectionProvider extends ChangeNotifier {

  bool _isSelected = false;
  String _videoUrl = "";
  Duration _duration = Duration.zero;

  bool get isSelected => _isSelected;
  String get videoUrl => _videoUrl;
  Duration get duration => _duration;

  changeSelection(bool isSelected, [String? url, Duration? duration]) {
    if (_isSelected != isSelected) {
      _isSelected = isSelected;
      _videoUrl = url ?? "";
      _duration = duration ?? Duration.zero;
      notifyListeners();
    }
  }

}