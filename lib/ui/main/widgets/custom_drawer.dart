import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  final TabController controller;

  const CustomDrawer({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CustomDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<CustomDrawer> {
  final List<String> _titles = const [
    "Home",
    "Experience",
    "Industrial Projects",
    "Demo Projects",
    "Contact Me",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: (provider.mode == ThemeMode.light) ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFEAE5C9), Color(0xFF6CC6CB)],
              ) : null,
            ),
            child: ListView(
              children: _titles
                  .mapIndexed((index, value) => ListTile(
                title: Text(value),
                onTap: () {
                  if (_titles[index] == "Contact Me") {
                    print("clicked");
                  } else {
                    setState(() {
                      widget.controller.index = index;
                    });
                  }
                  Navigator.pop(context);
                },
              ))
                  .toList(),
            ),
          ),
        );
      }
    );
  }
}
