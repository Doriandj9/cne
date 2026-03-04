import 'package:app_core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:posts_apps/config/dependencies.dart';
import 'package:posts_apps/routing/router.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: appProviders, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
