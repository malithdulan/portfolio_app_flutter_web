import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/constants.dart';
import 'error_item.dart';
import 'image_card.dart';
import 'loading_item.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? Constants.placeholderImage,
      imageBuilder: (context, imageProvider) => ImageCard(
        width: width,
        height: height,
        image: imageProvider,
        radius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        shadow: true,
      ),
      placeholder: (context, url) => ImageCard(
        width: width,
        height: height,
        child: const Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: LoadingItem(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => ImageCard(
        width: width,
        height: height,
        child: const Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: ErrorItem(),
          ),
        ),
      ),
    );
  }
}
