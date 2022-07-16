import 'package:flutter/material.dart';
import 'package:portfolio/providers/description_change_provider.dart';
import 'package:portfolio/providers/page_switch_provider.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';

import '../../providers/tile_selection_provider.dart';

class ProjectListTile extends StatefulWidget {
  final double screenSize;
  final int index;
  const ProjectListTile({Key? key, required this.screenSize, required this.index}) : super(key: key);

  @override
  State<ProjectListTile> createState() => _ProjectListTileState();
}

class _ProjectListTileState extends State<ProjectListTile> {
  _navigateToDetail(BuildContext context) {
    Provider.of<PageSwitchProvider>(context, listen: false).changePage(DISPLAY_PAGE.detail);
    Provider.of<DescriptionChangeProvider>(context, listen: false).changeIndex(widget.index);
  }

  _showDetail(BuildContext context) {
    _changeListTileColor(context);
    Provider.of<DescriptionChangeProvider>(context, listen: false).changeIndex(widget.index);
  }

  _changeListTileColor(BuildContext context) {
    Provider.of<TileSelectionProvider>(context, listen: false).changeSelection(widget.index);
  }

  _setInitialTileColor() {
    if (widget.screenSize > 1024) {
      Provider.of<TileSelectionProvider>(context, listen: false).changeSelection(0);
      Provider.of<DescriptionChangeProvider>(context, listen: false).changeIndex(0);
    }
  }

  @override
  void initState() {
    //change style when screen width greater than 1024
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _setInitialTileColor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Consumer<TileSelectionProvider>(
            builder: (context, provider, child) => ListTile(
              onTap: (widget.screenSize > 1024)
                  ? () => _showDetail(context)
                  : () => _navigateToDetail(context),
              selected: widget.index == provider.selectedItem,
              selectedTileColor: Colors.green,
              mouseCursor: SystemMouseCursors.click,
              leading: Image.asset(
                "assets/images/place_lan.jpg",
                fit: BoxFit.contain,
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  "GigaClear",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: const Text(
                "iOS",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              tileColor: Colors.lightGreen,
            ),
          ),
        ),
      ],
    );
  }
}
