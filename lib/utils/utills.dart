import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_data.dart';

import '../models/ratio.dart';

class Utils {
  //singleton implementation
  Utils._privateConstructor(); //private constructor
  static Utils? _shared; //shared instance
  static Utils get shared {
    _shared ??= Utils._privateConstructor();
    return _shared!;
  }

  //get image info
  Future<ImageInfo> getImageInfo(Image img) async {
    final c = Completer<ImageInfo>();
    img.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo i, bool _) {
      c.complete(i);
    }));
    return c.future;
  }

  //get width and height of a image
  Future<Ratio> getDimension(String url) async {
    Image image = Image.network(url);
    ImageInfo info = await Utils.shared.getImageInfo(image);
    return Ratio(
        width: info.image.width.toDouble(),
        height: info.image.height.toDouble());
  }

  //convert types to a single string
  String convertTypes(List<String>? types) {
    String value = "";
    types?.forEach((element) {
      value += (types[0] == element) ? element : " / $element";
    });
    return value;
  }

  double getErrorWidgetHeight(double height, double width) {
    double footerHeight = AppData.shared.height * 0.05;
    double appBarHeight = (width > 1024) ? 40 : AppData.shared.height * 0.05;
    return height - appBarHeight - footerHeight;
  }
}