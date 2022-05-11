import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/skills/skill_card.dart';


class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

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
                style: TextStyle(fontSize: 30),
                textAlign: (constraints.maxWidth > 1024)
                    ? TextAlign.left
                    : TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 150,
                  children: [
                    const SkillCard(),
                    Card(
                      child: Column(
                        children: [
                          Image.asset("assets/images/apple.png", width: double.infinity, height: 75,),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Image.asset("assets/images/flutter.jpg", width: double.infinity, height: 75,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
  }
}
