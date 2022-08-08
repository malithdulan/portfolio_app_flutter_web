import 'package:flutter/material.dart';
import 'package:portfolio/providers/description_change_provider.dart';
import 'package:portfolio/providers/page_switch_provider.dart';
import 'package:portfolio/ui/common_widgets/custom_network_image.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';

import '../../providers/tile_selection_provider.dart';

class ProjectListTile extends StatelessWidget {
  final double screenSize;
  final int index;
  final String? projectIconUrl;
  final String? projectName;
  final String? projectPlatform;

  const ProjectListTile({
    Key? key,
    required this.screenSize,
    required this.index,
    required this.projectIconUrl,
    required this.projectName,
    required this.projectPlatform,
  }) : super(key: key);

  _navigateToDetail(BuildContext context) {
    _switchListAndDetail(context, DISPLAY_PAGE.detail);
    _changePageDetail(context, index);
  }

  _showDetail(BuildContext context) {
    _changeListTileColor(context, index);
    _changePageDetail(context, index);
  }

  _changeListTileColor(BuildContext context, int index) {
    Provider.of<TileSelectionProvider>(context, listen: false)
        .changeSelection(index);
  }

  _changePageDetail(BuildContext context, int index) {
    Provider.of<DescriptionChangeProvider>(context, listen: false)
        .changeIndex(index);
  }

  //switch between list and detail
  _switchListAndDetail(BuildContext context, DISPLAY_PAGE selection) {
    Provider.of<PageSwitchProvider>(context, listen: false)
        .changePage(selection);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Consumer<TileSelectionProvider>(
            builder: (context, provider, child) => ListTile(
              onTap: (screenSize > 1024)
                  ? () => _showDetail(context)
                  : () => _navigateToDetail(context),
              selected: index == provider.selectedItem,
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
        ),
      ],
    );
  }
}
