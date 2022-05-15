import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/experience/widgets/experience_time_line.dart';


class ExperienceWidgetLayout extends StatelessWidget {
  const ExperienceWidgetLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Column(
            children: [
              const Text(
                "Experience",
                style: TextStyle(fontSize: 30, color: Color(0xFF778899)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                child: SizedBox(
                  width: (constraints.maxWidth > 1024)
                      ? constraints.maxWidth * 0.5
                      : (constraints.maxWidth > 600)
                      ? constraints.maxWidth * 0.7
                      : constraints.maxWidth * 0.9,
                  child: const ExperienceTimeLine(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
