import 'dart:async';
import 'package:flutter/material.dart';

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
    Image image = Image.asset(url);
    ImageInfo info = await Utils.shared.getImageInfo(image);
    return Ratio(
        width: info.image.width.toDouble(),
        height: info.image.height.toDouble());
  }
}