import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_app.dart';
import 'package:portfolio/providers/data_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/managers/firebase_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize firebase app
  await FirebaseManager.shared.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()..init()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}
