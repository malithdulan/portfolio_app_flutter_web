import 'package:flutter/material.dart';
import 'package:portfolio/providers/demo_page_switch_provider.dart';
import 'package:portfolio/ui/pages/demo_projects/widgets/demo_project_description.dart';
import 'package:portfolio/ui/pages/demo_projects/widgets/demo_project_list.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';
import '../../../providers/demo_description_change_provider.dart';
import '../../../providers/demo_tile_selection_provider.dart';

class DemoProjectsLayout extends StatefulWidget {
  const DemoProjectsLayout({Key? key}) : super(key: key);

  @override
  State<DemoProjectsLayout> createState() => _DemoProjectsLayoutState();
}

class _DemoProjectsLayoutState extends State<DemoProjectsLayout> {
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
        Provider.of<DemoPageSwitchProvider>(context, listen: false).changePage(DISPLAY_PAGE.list);
        Provider.of<DemoTileSelectionProvider>(context, listen: false).changeSelection(-1);
        _state = false;
      } else if (constraints.maxWidth > 1024 && !_state) {
        Provider.of<DemoTileSelectionProvider>(context, listen: false).changeSelection(0);
        Provider.of<DemoDescriptionChangeProvider>(context, listen: false).changeIndex(0);
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
                  child: DemoProjectList(
                    screenSize: constraints.maxWidth,
                  ),
                ),
                Container(
                  width: 5,
                  color: Colors.green,
                ),
                Flexible(
                  flex: 3,
                  child: DemoProjectDescription(
                    screenSize: constraints.maxWidth,
                  ),
                ),
              ],
            )
          : Consumer<DemoPageSwitchProvider>(
              builder: (context, provider, child) =>
                  provider.page == DISPLAY_PAGE.list
                      ? DemoProjectList(
                          screenSize: constraints.maxWidth,
                        )
                      : DemoProjectDescription(
                          screenSize: constraints.maxWidth,
                        ),
            );
    });
  }
}
