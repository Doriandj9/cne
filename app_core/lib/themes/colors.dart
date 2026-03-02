// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

abstract final class AppColors {
  static const azulCNE = Color(0xFF003366); // Azul marino principal
  static const azulClaro = Color(
    0xFFE3EDF7,
  ); // Azul suave para botones secundarios
  static const amarilloCNE = Color(
    0xFFFFD700,
  ); // Amarillo del banner y botones "Ver más"
  static const cremaCNE = Color(0xFFFFF9E6); // Fondo de los iconos circulares

  static const blancoPuro = Color(0xFFFFFFFF);
  static const grisFondo = Color(
    0xFFF8FAFC,
  ); // Fondo de la aplicación (off-white)
  static const grisTexto = Color(0xFF4A4A4A);
  static const grisSuave = Color(0xFFD1D5DB);

  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D000000);
  static const red1 = Color(0xFFB00020);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.azulCNE,
    onPrimary: AppColors.blancoPuro,
    secondary: AppColors.amarilloCNE,
    onSecondary: AppColors.azulCNE,
    surface: AppColors.grisFondo,
    onSurface: AppColors.azulCNE,
    error: red1,
    onError: AppColors.blancoPuro,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF4D86C1), // Un azul más legible en fondos oscuros
    onPrimary: AppColors.blancoPuro,
    secondary: AppColors.amarilloCNE,
    onSecondary: AppColors.azulCNE,
    surface: Color(0xFF121212),
    onSurface: AppColors.blancoPuro,
    error: red1,
    onError: Colors.black,
  );
}
