import 'package:cne_domicilios/config/dependencies.dart';
import 'package:cne_domicilios/routing/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:app_core/themes/theme.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: appProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}
