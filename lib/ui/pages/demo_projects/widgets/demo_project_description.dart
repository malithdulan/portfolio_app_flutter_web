import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/project_description_tile.dart';
import 'package:provider/provider.dart';

import '../../../../providers/page_switch_provider.dart';
import '../../../../utils/enums.dart';

class DemoProjectDescription extends StatelessWidget {
  final double screenSize;

  const DemoProjectDescription({Key? key, required this.screenSize}) : super(key: key);

  _exitFromDetailsPage(BuildContext context) {
    Provider.of<PageSwitchProvider>(context, listen: false).changePage(DISPLAY_PAGE.list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: const Text(
            "Details",
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          actions: (screenSize <= 1024) ? [
            IconButton(
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              onPressed: () => _exitFromDetailsPage(context),
            )
          ] : [],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [ProjectDescriptionTile()],
      ),
    );
  }
}
