import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_app.dart';
import 'package:portfolio/providers/data_provider.dart';
import 'package:portfolio/providers/demo_description_change_provider.dart';
import 'package:portfolio/providers/image_fullscreen_selection_provider.dart';
import 'package:portfolio/providers/demo_page_switch_provider.dart';
import 'package:portfolio/providers/industrial_description_change_provider.dart';
import 'package:portfolio/providers/industrial_page_switch_provider.dart';
import 'package:portfolio/providers/industrial_tile_selection_provider.dart';
import 'package:portfolio/providers/player_fullscreen_selection_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/providers/demo_tile_selection_provider.dart';
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
        ChangeNotifierProvider<DemoPageSwitchProvider>(create: (_) => DemoPageSwitchProvider()),
        ChangeNotifierProvider<IndustrialPageSwitchProvider>(create: (_) => IndustrialPageSwitchProvider()),
        ChangeNotifierProvider<DemoDescriptionChangeProvider>(create: (_) => DemoDescriptionChangeProvider()),
        ChangeNotifierProvider<IndustrialDescriptionChangeProvider>(create: (_) => IndustrialDescriptionChangeProvider()),
        ChangeNotifierProvider<DemoTileSelectionProvider>(create: (_) => DemoTileSelectionProvider()),
        ChangeNotifierProvider<IndustrialTileSelectionProvider>(create: (_) => IndustrialTileSelectionProvider()),
        ChangeNotifierProvider<PlayerFullscreenSelectionProvider>(create: (_) => PlayerFullscreenSelectionProvider()),
        ChangeNotifierProvider<ImageFullscreenSelectionProvider>(create: (_) => ImageFullscreenSelectionProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}
