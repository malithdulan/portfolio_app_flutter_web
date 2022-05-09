import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/profile/profile.dart';
import 'package:portfolio/ui/pages/home/widgets/qualifications/qualifications.dart';
import 'package:portfolio/ui/pages/home/widgets/skills/skills.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Profile(),
          Skills(),
          Qualifications()
        ],
      ),
    );
  }
}
