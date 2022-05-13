import 'package:flutter/material.dart';
import 'package:portfolio/ui/common_widgets/gradient_button.dart';

import '../../../../utils/scaffold_keys.dart';

class NavBarContent extends StatefulWidget {
  final TabController controller;
  final List<String> titles;

  const NavBarContent(
      {Key? key, required this.controller, required this.titles})
      : super(key: key);

  @override
  State<NavBarContent> createState() => _NavBarContentState();
}

class _NavBarContentState extends State<NavBarContent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) => (width > 650)
          ? Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: double.infinity,
                  child: Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: TabBar(
                      controller: widget.controller,
                      tabs: widget.titles.map((e) => Text(e)).toList(),
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      labelPadding: const EdgeInsets.all(0),
                    ),
                  ),
                )),
                (width > 1024)
                    ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: GradientButton(
                          callBack: () {},
                          title: "Contact Me",
                        ),
                    )
                    : const SizedBox(),
              ],
            )
          : Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    ScaffoldKeys.mainKey.currentState?.openEndDrawer(),
                icon: const Icon(
                  Icons.menu_rounded,
                ),
                color: Colors.green,
              ),
            ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
