import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/image_slider.dart';

class ProjectDescriptionTileBiggerLayout extends StatelessWidget {
  final List<String>? imageList;
  final String? description;

  const ProjectDescriptionTileBiggerLayout({
    Key? key,
    required this.imageList,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      color: Colors.green.withOpacity(0.2),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ImageSlider(images: imageList, width: 300,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
