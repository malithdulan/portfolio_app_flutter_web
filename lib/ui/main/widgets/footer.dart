import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_data.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: AppData.shared.height * 0.05,
    );
  }
}
