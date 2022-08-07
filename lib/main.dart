import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_app.dart';
import 'package:portfolio/providers/data_provider.dart';
import 'package:portfolio/providers/description_change_provider.dart';
import 'package:portfolio/providers/image_fullscreen_selection_provider.dart';
import 'package:portfolio/providers/page_switch_provider.dart';
import 'package:portfolio/providers/player_fullscreen_selection_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/providers/tile_selection_provider.dart';
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
        ChangeNotifierProvider<PageSwitchProvider>(create: (_) => PageSwitchProvider()),
        ChangeNotifierProvider<DescriptionChangeProvider>(create: (_) => DescriptionChangeProvider()),
        ChangeNotifierProvider<TileSelectionProvider>(create: (_) => TileSelectionProvider()),
        ChangeNotifierProvider<PlayerFullscreenSelectionProvider>(create: (_) => PlayerFullscreenSelectionProvider()),
        ChangeNotifierProvider<ImageFullscreenSelectionProvider>(create: (_) => ImageFullscreenSelectionProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}
