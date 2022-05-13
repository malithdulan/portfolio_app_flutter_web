import 'package:flutter/material.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/main/main_page.dart';
import 'package:portfolio/utils/app_themes.dart';
import 'package:provider/provider.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: "Portfolio",
          debugShowCheckedModeBanner: false,
          themeMode: provider.mode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          home: const MainPage(),
        );
      },
    );
  }
}
