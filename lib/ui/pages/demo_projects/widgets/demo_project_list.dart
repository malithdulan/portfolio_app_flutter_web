import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/project_list_tile.dart';

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ProjectListTile(key: ValueKey("$index projectList"), screenSize: screenSize,);
        },
        itemCount: 5,
      ),
    );
  }
}
