import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/shimmer_animation.dart';

class ShimmerProfileDesktopLayout extends StatelessWidget {
  const ShimmerProfileDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        children: [
          ShimmerAnimation(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerAnimation(
                      child: Container(
                        width: 500,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ShimmerAnimation(
                      child: Container(
                        width: 500,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ShimmerAnimation(
                  child: Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ShimmerAnimation(
                  child: Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
