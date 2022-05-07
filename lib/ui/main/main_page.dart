import 'package:flutter/material.dart';
import 'package:portfolio/ui/main/widgets/custom_drawer.dart';
import 'package:portfolio/ui/main/widgets/footer.dart';
import 'package:portfolio/ui/main/widgets/nav_bar.dart';
import 'package:portfolio/ui/pages/demo_projects/demo_projects_page.dart';
import 'package:portfolio/ui/pages/home/home_page.dart';
import 'package:portfolio/ui/pages/industrial_projects/industrial_projects_page.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:portfolio/utils/scaffold_keys.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  final List<Widget> _pages = const [
    HomePage(),
    IndustrialProjectsPage(),
    DemoProjectsPage()
  ];

  final List<String> _titles = const [
    "Home",
    "Industrial Projects",
    "Demo Projects",
  ];

  @override
  void initState() {
    _controller = TabController(length: _pages.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //set important app data
    AppData.shared.setDeviceValues(context);
    return Scaffold(
      key: ScaffoldKeys.mainKey,
      endDrawer: CustomDrawer(controller: _controller, titles: _titles),
      body: SizedBox(
        height: AppData.shared.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavBar(
              controller: _controller,
              titles: _titles,
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: _pages,
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
