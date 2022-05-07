import 'package:flutter/material.dart';
import 'package:portfolio/ui/main/main_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Portfolio",
      home: MainPage(),
    );
  }
}
