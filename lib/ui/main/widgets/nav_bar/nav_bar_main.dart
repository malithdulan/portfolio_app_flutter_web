import 'package:flutter/material.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NavBarMain extends StatelessWidget {
  final double width;
  const NavBarMain({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: (width > 600) ? 0 : 10) ,
      width: (width > 600) ? width * 0.3 : width * 0.8,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GradientText(
            "Portfolio",
            style: const TextStyle(
              fontSize: 25,
            ),
            colors: const [
              Colors.green,
              Colors.greenAccent,
            ],
          ),
          Consumer<ThemeProvider>(builder: (context, provider, child) {
            return IconButton(
              onPressed: () {
                //set appdata theme
                if (provider.mode == ThemeMode.dark) {
                  AppData.shared.mode = ThemeMode.light;
                } else {
                  AppData.shared.mode = ThemeMode.dark;
                }
                //trigger change theme
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme(provider.mode == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark);
              },
              padding: EdgeInsets.zero,
              icon: FaIcon(
                (provider.mode == ThemeMode.light)
                    ? FontAwesomeIcons.moon
                    : FontAwesomeIcons.sun,
                size: 20,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            );
          }),
        ],
      ),
    );
  }
}
