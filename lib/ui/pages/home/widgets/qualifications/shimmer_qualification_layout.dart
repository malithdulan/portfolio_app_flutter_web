import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/shimmer_animation.dart';

class ShimmerQualificationLayout extends StatelessWidget {
  const ShimmerQualificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            ShimmerAnimation(child: Container(
              width: 300,
              height: 30,
              color: Colors.white,
            )),
            const SizedBox(height: 10,),
            SizedBox(
              width: (constraints.maxWidth > 1024)
                  ? constraints.maxWidth * 0.5
                  : (constraints.maxWidth > 600)
                  ? constraints.maxWidth * 0.7
                  : constraints.maxWidth * 0.8,
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
