import 'package:SongGPT/presentation/screens/mainnavigation_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_notifier.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    // ChangeNotifierProvider(create: (_) => Counter()), // Add theme notifier
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    if (kDebugMode) {
      print(
          'Building MyApp with theme: ${themeNotifier.isDarkMode ? 'Dark' : 'Light'}');
    }
    return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: MainNavigation());
  }
}