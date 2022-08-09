import 'package:flutter/material.dart';
import 'package:portfolio/utils/enums.dart';

class DemoPageSwitchProvider extends ChangeNotifier {

  DISPLAY_PAGE _page = DISPLAY_PAGE.list;

  DISPLAY_PAGE get page => _page;

  changePage(DISPLAY_PAGE page) {
    _page = page;
    notifyListeners();
  }

}