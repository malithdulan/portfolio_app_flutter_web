import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/skills/skill_card.dart';
import 'package:provider/provider.dart';

import '../../../../../models/skills.dart';
import '../../../../../providers/data_provider.dart';

class SkillsLayout extends StatelessWidget {
  const SkillsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (constraints.maxWidth > 1024)
                ? 40
                : (constraints.maxWidth > 600)
                ? 20
                : 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Skills",
              style: const TextStyle(fontSize: 30, color: Color(0xFF778899)),
              textAlign: (constraints.maxWidth > 1024)
                  ? TextAlign.left
                  : TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 150,
              child: Selector<DataProvider, List<Skills>?>(
                  selector: (context, provider) => provider.data?.data?.skills,
                  builder: (context, data, child) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 150,
                      itemBuilder: (context, index) {
                        return SkillCard(
                          image: data?[index].picUrl,
                          title: data?[index].title,
                          types: data?[index].types,
                        );
                      },
                      itemCount: data?.length,
                    );
                  }
              ),
            ),
          ],
        ),
      );
    });
  }
}
