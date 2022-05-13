import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimation extends StatelessWidget {
  final Widget child;
  const ShimmerAnimation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(175, 225, 175, 1),
      highlightColor: const Color.fromRGBO(95, 158, 160, 1),
      child: child,
    );
  }
}
