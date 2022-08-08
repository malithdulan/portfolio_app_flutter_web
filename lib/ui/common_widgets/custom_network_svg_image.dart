import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';
import 'loading_item.dart';

class CustomNetworkSvgImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  const CustomNetworkSvgImage({Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl ?? Constants.defaultSvg,
      width: width,
      height: height,
      fit: BoxFit.contain,
      placeholderBuilder: (context) {
        return Container(
          color: Colors.black26,
          width: width,
          height: height,
          child: const Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: LoadingItem(),
            ),
          ),
        );
      },
    );
  }
}
