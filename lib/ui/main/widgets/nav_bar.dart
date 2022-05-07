import 'package:flutter/material.dart';
import 'package:portfolio/utils/scaffold_keys.dart';

class NavBar extends StatefulWidget {
  final List<String> titles;
  final TabController controller;
  const NavBar({Key? key, required this.titles, required this.controller})
      : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.21
        : screenWidth > 1100
            ? 0.3
            : 0.5;

    return LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth > 600
            ? Container(
                color: Colors.green,
                width: screenWidth * tabBarScaling,
                child: Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  child: TabBar(
                    controller: widget.controller,
                    tabs: widget.titles.map((e) => Text(e)).toList(),
                    indicatorColor: Colors.deepOrange,
                  ),
                ),
              )
            : IconButton(
                onPressed: () =>
                    ScaffoldKeys.mainKey.currentState?.openEndDrawer(),
                icon: const Icon(Icons.menu_rounded),
                color: Colors.white,
                iconSize: screenWidth * 0.08,
              ));
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
