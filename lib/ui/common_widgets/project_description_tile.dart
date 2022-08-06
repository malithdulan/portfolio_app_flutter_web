import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/project_description_tile_bigger_layout.dart';
import 'package:portfolio/ui/common_widgets/project_description_tile_mobile_layout.dart';

class ProjectDescriptionTile extends StatelessWidget {
  final List<String>? imageList;
  final String? description;
  final double screenWidth;

  const ProjectDescriptionTile({
    Key? key,
    required this.imageList,
    required this.description,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (screenWidth > 640)
        ? ProjectDescriptionTileBiggerLayout(
            imageList: imageList,
            description: description,
          )
        : ProjectDescriptionTileMobileLayout(
            imageList: imageList,
            description: description,
          );
  }
}
