import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

//
export 'color_theme.dart';
export 'text_theme.dart';
export 'sizes_theme.dart';
//

class MaviTheme {
  MaviTextTheme get textTheme => MaviTextTheme();
  MaviColorTheme get colorTheme => MaviColorTheme();
}

ThemeData light() {
  return ThemeData.light().copyWith();
}

ThemeData dark() {
  return ThemeData.dark().copyWith();
}
