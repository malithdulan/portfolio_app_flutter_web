import 'package:flutter/material.dart';

import '../../../common_widgets/shimmer_animation.dart';

class ShimmerExperienceWidgetLayout extends StatelessWidget {
  const ShimmerExperienceWidgetLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            ShimmerAnimation(child: Container(
              width: (constraints.maxWidth > 1024)
                  ? constraints.maxWidth * 0.3
                  : (constraints.maxWidth > 600)
                  ? constraints.maxWidth * 0.5
                  : constraints.maxWidth * 0.7,
              height: 30,
              color: Colors.white,
            )),
            const SizedBox(height: 10,),
            SizedBox(
              width: (constraints.maxWidth > 1024)
                  ? constraints.maxWidth * 0.5
                  : (constraints.maxWidth > 600)
                  ? constraints.maxWidth * 0.7
                  : constraints.maxWidth * 0.9,
              child: AspectRatio(
                aspectRatio: 1,
                child: ShimmerAnimation(child: Container(
                  color: Colors.white,
                )),
              ),
            )
          ],
        ),
      );
    });
  }
}
