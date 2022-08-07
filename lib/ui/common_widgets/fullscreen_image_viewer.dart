import 'package:flutter/material.dart';
import 'package:portfolio/providers/image_fullscreen_selection_provider.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

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
          Image.network(
            imageUrl ?? Constants.placeholderImage,
            fit: BoxFit.contain,
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
