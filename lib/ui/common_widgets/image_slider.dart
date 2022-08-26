import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/utils.dart';

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
                child: CustomNetworkImage(imageUrl: widget.images?[index]),
                mouseCursor: SystemMouseCursors.click,
                onTap: () => Utils.shared.showFullscreenImage(context, widget.images?[index]),
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
