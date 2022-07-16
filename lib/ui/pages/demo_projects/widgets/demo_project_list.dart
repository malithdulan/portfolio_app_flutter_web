import 'package:flutter/material.dart';
import 'package:portfolio/models/demo_projects.dart';
import 'package:portfolio/ui/common_widgets/project_list_tile.dart';
import 'package:provider/provider.dart';
import '../../../../providers/data_provider.dart';

class DemoProjectList extends StatelessWidget {
  final double screenSize;
  const DemoProjectList({Key? key, required this.screenSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: const Text(
            "Projects",
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Selector<DataProvider, List<DemoProjects>?>(
          selector: (context, provider) => provider.data?.data?.demoProjects,
          builder: (context, data, child) => ListView.builder(
            itemBuilder: (context, index) {
              return ProjectListTile(
                key: ValueKey("$index projectList"),
                screenSize: screenSize,
                index: index,
              );
            },
            itemCount: 2,
          ),
      ),
    );
  }
}
