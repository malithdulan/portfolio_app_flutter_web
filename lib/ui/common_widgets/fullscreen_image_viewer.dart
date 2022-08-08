import 'package:flutter/material.dart';
import 'package:portfolio/providers/image_fullscreen_selection_provider.dart';
import 'package:portfolio/ui/common_widgets/loading_item.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'error_item.dart';

class FullscreenImageViewer extends StatelessWidget {
  final String? imageUrl;

  const FullscreenImageViewer({Key? key, required this.imageUrl})
      : super(key: key);

  _closeImageViewer(BuildContext context) {
    Provider.of<ImageFullscreenSelectionProvider>(context, listen: false)
        .changeSelection(isSelected: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black.withOpacity(0.7),
      padding: const EdgeInsets.all(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl ?? Constants.placeholderImage,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
              child: SizedBox(
                width: 75,
                height: 75,
                child: LoadingItem(),
              ),
            ),
            errorWidget: (context, url, error) => const ErrorItem(),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              onPressed: () => _closeImageViewer(context),
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
