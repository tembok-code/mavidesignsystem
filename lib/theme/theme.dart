import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

//
export 'color_theme.dart';
export 'text_theme.dart';
export 'sizes_theme.dart';
//

class MaviTheme {
  MaviTextTheme get textTheme => MaviTextTheme();

  get themeData => data();

  ThemeData data(
      {MaviPaletteOptions palette = MaviPaletteOptions.mavi,
      Brightness? brightness}) {
    var _scheme = palette.colorScheme.light;
    switch (brightness) {
      case Brightness.dark:
        _scheme = palette.colorScheme.dark;
        break;
      default:
        break;
    }
    return ThemeData(
        useMaterial3: true,
        colorScheme: brightness == Brightness.light
            ? palette.colorScheme.light
            : palette.colorScheme.dark,
        primarySwatch: palette.colorScheme.color);
  }
}
