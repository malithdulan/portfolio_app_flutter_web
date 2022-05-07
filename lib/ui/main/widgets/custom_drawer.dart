import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CustomDrawer extends StatefulWidget {
  final TabController controller;
  final List<String> titles;
  const CustomDrawer({Key? key, required this.controller, required this.titles}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: widget.titles
            .mapIndexed((index, e) => Container(
          child: ListTile(
            title: Text(e),
            onTap: () {
              setState(() {
                widget.controller.index = index;
              });
              Navigator.pop(context);
            },
          ),
        ))
            .toList(),
      ),
    );
  }
}
