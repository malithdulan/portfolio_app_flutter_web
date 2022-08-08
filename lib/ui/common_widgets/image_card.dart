import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final BorderRadius? radius;
  final bool shadow;
  final ImageProvider? image;
  final Widget? child;
  final double? width;
  final double? height;
  const ImageCard({
    Key? key,
    this.radius,
    this.shadow = true,
    this.image,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: child,
      decoration: BoxDecoration(
        borderRadius: radius,
        image: (image != null) ? DecorationImage(
          image: image!,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
            Colors.black12,
            BlendMode.lighten,
          ),
        ) : null,
        boxShadow: shadow
            ? const [
          BoxShadow(blurRadius: 5),
        ]
            : null,
      ),
    );
  }
}