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
    _switchListAndDetail(DISPLAY_PAGE.detail);
    _changePageDetail(widget.index);
  }

  _showDetail(BuildContext context) {
    _changeListTileColor(context, widget.index);
    _changePageDetail(widget.index);
  }

  _changeListTileColor(BuildContext context, int index) {
    Provider.of<TileSelectionProvider>(context, listen: false).changeSelection(index);
  }

  _changePageDetail(int index) {
    Provider.of<DescriptionChangeProvider>(context, listen: false).changeIndex(index);
  }

  //switch between list and detail
  _switchListAndDetail(DISPLAY_PAGE selection) {
    Provider.of<PageSwitchProvider>(context, listen: false).changePage(selection);
  }

  _setInitialTileColor() {
    if (widget.screenSize > 1024) {
      _changeListTileColor(context, 0);
      _changePageDetail(0);
    }
  }

  @override
  void initState() {
    //select first tile with description
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
