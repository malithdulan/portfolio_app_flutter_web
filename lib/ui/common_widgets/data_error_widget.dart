import 'package:flutter/material.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:lottie/lottie.dart';

class DataErrorWidget extends StatelessWidget {
  const DataErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: double.infinity,
        height: Utils.shared.getErrorWidgetHeight(
          MediaQuery.of(context).size.height,
          constraints.maxWidth,
        ),
        child: Lottie.asset(
          "jsons/error-dark.json",
          fit: BoxFit.contain,
          repeat: false,
        ),
      );
    });
  }
}
