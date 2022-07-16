import 'package:flutter/material.dart';
import 'package:portfolio/providers/page_switch_provider.dart';
import 'package:portfolio/ui/pages/demo_projects/widgets/demo_project_description.dart';
import 'package:portfolio/ui/pages/demo_projects/widgets/demo_project_list.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';

class DemoProjectsLayout extends StatelessWidget {
  const DemoProjectsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
          : Consumer<PageSwitchProvider>(
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
