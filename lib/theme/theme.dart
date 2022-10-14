import 'package:flutter/material.dart';

import '../theme/text_theme.dart';
//
export 'color_schemes.dart';
export 'text_theme.dart';
export 'sizes_theme.dart';
//

class MaviTheme {
  get text => MaviTextTheme();
}

ThemeData light() {
  return ThemeData.light().copyWith();
}

ThemeData dark() {
  return ThemeData.dark().copyWith();
}
