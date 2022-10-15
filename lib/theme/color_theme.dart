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

  ColorScheme get light => MaviColorScheme().light;
  ColorScheme get dark => MaviColorScheme().dark;
}
