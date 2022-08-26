import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';

class ProjectListTile extends StatelessWidget {
  final double screenSize;
  final int index;
  final String? projectIconUrl;
  final String? projectName;
  final String? projectPlatform;
  final int selectedItem;
  final Function showDetail;
  final Function navigateToDetail;

  const ProjectListTile({
    Key? key,
    required this.screenSize,
    required this.index,
    required this.projectIconUrl,
    required this.projectName,
    required this.projectPlatform,
    required this.selectedItem,
    required this.showDetail,
    required this.navigateToDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: ListTile(
            onTap: (screenSize > 1024)
                ? () => showDetail(context, index)
                : () => navigateToDetail(context, index),
            selected: index == selectedItem,
            selectedTileColor: Colors.green.shade700,
            mouseCursor: SystemMouseCursors.click,
            leading: CustomNetworkImage(
              imageUrl: projectIconUrl,
              width: 50,
              height: 50,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                projectName ?? "",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Text(
              projectPlatform ?? "",
            ),
            tileColor: Colors.green.shade500,
          ),
        ),
      ],
    );
  }
}
