import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/industrial_projects/widgets/industrial_project_description.dart';
import 'package:portfolio/ui/pages/industrial_projects/widgets/industrial_project_list.dart';
import 'package:provider/provider.dart';

import '../../../providers/industrial_description_change_provider.dart';
import '../../../providers/industrial_page_switch_provider.dart';
import '../../../providers/industrial_tile_selection_provider.dart';
import '../../../utils/enums.dart';

class IndustrialPageLayout extends StatefulWidget {
  const IndustrialPageLayout({Key? key}) : super(key: key);

  @override
  State<IndustrialPageLayout> createState() => _IndustrialPageLayoutState();
}

class _IndustrialPageLayoutState extends State<IndustrialPageLayout> {
  late bool _state;

  @override
  void initState() {
    _state = false;
    super.initState();
  }

  //clear tile selection and show project list page when doing the screen resizing below width 1025
  //add initial selection of tile, width above 1024
  _clearTileSelection(BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (constraints.maxWidth <= 1024 && _state) {
        Provider.of<IndustrialPageSwitchProvider>(context, listen: false).changePage(DISPLAY_PAGE.list);
        Provider.of<IndustrialTileSelectionProvider>(context, listen: false).changeSelection(-1);
        _state = false;
      } else if (constraints.maxWidth > 1024 && !_state) {
        Provider.of<IndustrialTileSelectionProvider>(context, listen: false).changeSelection(0);
        Provider.of<IndustrialDescriptionChangeProvider>(context, listen: false).changeIndex(0);
        _state = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      _clearTileSelection(constraints);
      return (constraints.maxWidth > 1024)
          ? Row(
        children: [
          Flexible(
            flex: 1,
            child: IndustrialProjectList(
              screenSize: constraints.maxWidth,
            ),
          ),
          Container(
            width: 5,
            color: Colors.green,
          ),
          Flexible(
            flex: 3,
            child: IndustrialProjectDescription(
              screenSize: constraints.maxWidth,
            ),
          ),
        ],
      )
          : Consumer<IndustrialPageSwitchProvider>(
        builder: (context, provider, child) =>
        provider.page == DISPLAY_PAGE.list
            ? IndustrialProjectList(
          screenSize: constraints.maxWidth,
        )
            : IndustrialProjectDescription(
          screenSize: constraints.maxWidth,
        ),
      );
    });
  }
}
