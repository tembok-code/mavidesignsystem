import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';
//
import '../globals.dart' as globals;
//
export 'color_theme.dart';
export 'text_theme.dart';
export 'sizes_theme.dart';
//

class MaviTheme {
  //
  MaviTextTheme get textTheme => MaviTextTheme();

  ThemeData themeData({Brightness? overrideBrightness}) {
    late ColorScheme _scheme;
    switch (overrideBrightness ?? globals.brightness) {
      case Brightness.dark:
        _scheme = globals.palette.colorScheme.dark;
        break;
      default:
        _scheme = globals.palette.colorScheme.light;
        break;
    }
    return ThemeData(
      useMaterial3: true,
      colorScheme: _scheme,
      //primarySwatch: globals.palette.colorScheme.color,
    );
  }
}
