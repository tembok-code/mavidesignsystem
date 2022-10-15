import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

import 'color_schemes.dart';

enum MaviPaletteOptions { mavi, reddel }

extension MaviThemePaletteOptions on MaviPaletteOptions {
  MaviColorScheme get colorScheme {
    switch (this) {
      case MaviPaletteOptions.reddel:
        return ReddelColorScheme();
      default:
        return MaviColorScheme();
    }
  }
}

extension MaviColorThemeExtension on MaviTheme {
  MaterialColor get colorSwatch => MaviColorScheme().color;
  MaterialColor get colorSecondarySwatch => MaviColorScheme().colorSecondary;
  MaterialColor get colorNeutralSwatch => MaviColorScheme().colorNeutral;

  ColorScheme get light => MaviColorScheme().light;
  ColorScheme get dark => MaviColorScheme().dark;

  ColorScheme get solid {
    switch (ThemeMode.system) {
      case ThemeMode.dark:
        return MaviColorScheme().darkSolid;
      default:
        return MaviColorScheme().lightSolid;
    }
  }

  ColorScheme get soft {
    switch (ThemeMode.system) {
      case ThemeMode.dark:
        return MaviColorScheme().darkSoft;
      default:
        return MaviColorScheme().lightSoft;
    }
  }

  ColorScheme get outlined {
    switch (ThemeMode.system) {
      case ThemeMode.dark:
        return MaviColorScheme().darkOutlined;
      default:
        return MaviColorScheme().lightOutlined;
    }
  }

  ColorScheme get plain {
    switch (ThemeMode.system) {
      case ThemeMode.dark:
        return MaviColorScheme().darkPlain;
      default:
        return MaviColorScheme().lightPlain;
    }
  }
}

extension ColorFunctions on Color {
  MaterialColor generateMaterialColor() {
    return MaterialColor(value, {
      50: tintColor(0.9),
      100: tintColor(0.8),
      200: tintColor(0.6),
      300: tintColor(0.4),
      400: tintColor(0.2),
      500: this,
      600: shadeColor(0.1),
      700: shadeColor(0.2),
      800: shadeColor(0.3),
      900: shadeColor(0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(double factor) => Color.fromRGBO(tintValue(red, factor),
      tintValue(green, factor), tintValue(blue, factor), 1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(double factor) => Color.fromRGBO(shadeValue(red, factor),
      shadeValue(green, factor), shadeValue(blue, factor), 1);
}
