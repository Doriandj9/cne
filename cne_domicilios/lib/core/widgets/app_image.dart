import 'package:cne_domicilios/config/env.dart';
import 'package:flutter/widgets.dart';

abstract class AppImage {
  AppImage._();

  static Widget assets(String name) {
    final isProduction = Env.environment == 'production';
    return isProduction
        ? Image.asset(name, package: 'cne_domicilios')
        : Image.asset(name);
  }
}
