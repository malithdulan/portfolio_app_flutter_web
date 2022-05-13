import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_data.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: AppData.shared.height * 0.05,
      child: const Center(
        child: Text(
          "© 2022 Malith Dulan Kuruwita. All rights reserved.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
