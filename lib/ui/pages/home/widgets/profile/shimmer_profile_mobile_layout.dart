import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/shimmer_animation.dart';

class ShimmerProfileMobileLayout extends StatelessWidget {
  const ShimmerProfileMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          ShimmerAnimation(
            child: Container(
              width: 150,
              height: 150,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShimmerAnimation(
                child: Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ShimmerAnimation(
                child: Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ShimmerAnimation(
                  child: Container(
                    width: double.infinity,
                    height: 14,
                    color: Colors.white,
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ShimmerAnimation(
                  child: Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
