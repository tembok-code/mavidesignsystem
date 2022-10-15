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
