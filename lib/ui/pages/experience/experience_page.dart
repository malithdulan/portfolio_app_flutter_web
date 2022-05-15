import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/experience/widgets/experience_widget.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: ExperienceWidget(),
    );
  }
}
