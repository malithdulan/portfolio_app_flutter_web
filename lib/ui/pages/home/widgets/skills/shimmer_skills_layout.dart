import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/shimmer_animation.dart';

class ShimmerSkillsLayout extends StatelessWidget {
  const ShimmerSkillsLayout({Key? key}) : super(key: key);

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
          children: [
            Align(
              alignment: (constraints.maxWidth > 1024)
                  ? Alignment.centerLeft
                  : Alignment.center,
              child: ShimmerAnimation(
                child: Container(
                  height: 30,
                  width: 300,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerAnimation(
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    });
  }
}
