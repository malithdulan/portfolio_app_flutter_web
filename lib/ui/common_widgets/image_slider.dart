import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/providers/image_fullscreen_selection_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants.dart';
import 'package:provider/provider.dart';

class ImageSlider extends StatefulWidget {
  final List<String>? images;
  final double width;

  const ImageSlider({Key? key, required this.images, required this.width})
      : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _activeIndex = 0;

  //show image in fullscreen
  _showFullscreenImage(int index) {
    Provider.of<ImageFullscreenSelectionProvider>(context, listen: false)
        .changeSelection(
      isSelected: true,
      url: widget.images?[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: Colors.black26,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.images?.length,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                child: Image.network(
                  widget.images?[index] ?? Constants.placeholderImage,
                  fit: BoxFit.contain,
                ),
                mouseCursor: SystemMouseCursors.click,
                onTap: () => _showFullscreenImage(index),
              );
            },
            options: CarouselOptions(
              height: 300,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _activeIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AnimatedSmoothIndicator(
            activeIndex: _activeIndex,
            count: widget.images?.length ?? 0,
            effect: const WormEffect(
              activeDotColor: Colors.green,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ],
      ),
    );
  }
}
