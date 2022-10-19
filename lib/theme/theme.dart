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

class MaviThemeProvider extends ChangeNotifier {
  /// Not needed if using MMaterialApp widget
  /// MMaterialApp values have priority and are set as default over these initial values
  ///
  MaviThemeProvider(
      {this.initialMode = ThemeMode.light,
      this.initialPalette = MaviPaletteOptions.mavi}) {
    //*set initial model
    mode = initialMode;
    globals.brightness =
        mode == ThemeMode.light ? Brightness.light : Brightness.dark;
    //*set initial palette
    palette = initialPalette;
    globals.palette = initialPalette;
  }
  final ThemeMode initialMode;
  final MaviPaletteOptions initialPalette;
  //

  late ThemeMode mode;
  late MaviPaletteOptions palette;

  toggleMode({ThemeMode? modeValue}) {
    mode = modeValue ??
        (mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    globals.brightness =
        mode == ThemeMode.light ? Brightness.light : Brightness.dark;
    notifyListeners();
  }
}
