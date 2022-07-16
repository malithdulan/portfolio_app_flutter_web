import 'package:flutter/material.dart';
import 'package:portfolio/providers/page_switch_provider.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';

class ProjectListTile extends StatelessWidget {
  final double screenSize;

  const ProjectListTile({Key? key, required this.screenSize}) : super(key: key);

  _navigateToDetail(BuildContext context) {
    print("navigate");
    Provider.of<PageSwitchProvider>(context, listen: false).changePage(DISPLAY_PAGE.detail);
  }

  _showDetail() {
    print("show detail");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (screenSize > 1024)
          ? () => _showDetail()
          : () => _navigateToDetail(context),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/place_lan.jpg",
              fit: BoxFit.contain,
            ),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: Text(
                "GigaClear",
                style: TextStyle(
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: const Text(
              "iOS",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            tileColor: Colors.lightGreen,
          ),
        ],
      ),
    );
  }
}
