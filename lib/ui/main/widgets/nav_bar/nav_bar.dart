import 'package:flutter/material.dart';
import 'package:portfolio/ui/main/widgets/nav_bar/nav_bar_content.dart';
import 'package:portfolio/ui/main/widgets/nav_bar/nav_bar_main.dart';
import 'package:portfolio/utils/app_data.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: (constraints.maxWidth > 1024) ? 40 : AppData.shared.height * 0.05,
          child: Row(
            children: [
              NavBarMain(width: constraints.maxWidth,),
              Expanded(
                child: NavBarContent(
                  controller: widget.controller,
                  titles: widget.titles,
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
