import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/qualifications/qualification_card.dart';

class Qualifications extends StatelessWidget {
  const Qualifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            const Text(
              "Qualifications",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            QualificationCard(
                screenWidth: constraints.maxWidth
            ),
          ],
        ),
      );
    });
  }
}
