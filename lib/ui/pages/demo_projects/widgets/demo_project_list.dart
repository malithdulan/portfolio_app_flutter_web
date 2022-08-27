import 'package:flutter/material.dart';
import 'package:portfolio/models/demo_projects.dart';
import 'package:portfolio/ui/common_widgets/project_list_tile.dart';
import 'package:provider/provider.dart';
import '../../../../providers/data_provider.dart';
import '../../../../providers/demo_description_change_provider.dart';
import '../../../../providers/demo_page_switch_provider.dart';
import '../../../../providers/demo_tile_selection_provider.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/enums.dart';

class DemoProjectList extends StatelessWidget {
  final double screenSize;

  const DemoProjectList({Key? key, required this.screenSize}) : super(key: key);

  _navigateToDetail(BuildContext context, int index) {
    _switchListAndDetail(context, DISPLAY_PAGE.detail);
    _changePageDetail(context, index);
  }

  _showDetail(BuildContext context, int index) {
    _changeListTileColor(context, index);
    _changePageDetail(context, index);
  }

  _changeListTileColor(BuildContext context, int index) {
    Provider.of<DemoTileSelectionProvider>(context, listen: false)
        .changeSelection(index);
  }

  _changePageDetail(BuildContext context, int index) {
    Provider.of<DemoDescriptionChangeProvider>(context, listen: false)
        .changeIndex(index);
  }

  //switch between list and detail
  _switchListAndDetail(BuildContext context, DISPLAY_PAGE selection) {
    Provider.of<DemoPageSwitchProvider>(context, listen: false)
        .changePage(selection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: const Text(
            "Demo Projects",
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Selector<DataProvider, List<DemoProjects>?>(
        selector: (context, provider) => provider.data?.data?.demoProjects,
        builder: (context, data, child) => ListView.builder(
          controller: ScrollController(),
          itemBuilder: (context, index) {
            return Consumer<DemoTileSelectionProvider>(
              builder: (context, provider, child) => ProjectListTile(
                key: ValueKey("$index ${Constants.demoProjectListTile}"),
                screenSize: screenSize,
                index: index,
                projectIconUrl: data?[index].appIconUrl,
                projectName: data?[index].title,
                projectPlatform: data?[index].platform,
                selectedItem: provider.selectedItem,
                showDetail: _showDetail,
                navigateToDetail: _navigateToDetail,
              ),
            );
          },
          itemCount: data?.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 5),
        ),
      ),
    );
  }
}
