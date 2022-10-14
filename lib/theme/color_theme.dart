import 'package:flutter/material.dart';

import 'color_schemes.dart';

class MaviColorTheme {
  static Color primary = Colors.blue;
  //
  PrimaryColor get primaryShades => PrimaryColor();
  //
  ColorScheme lightScheme({Color? color}) => lightColorScheme(color: color);
  ColorScheme darkScheme({Color? color}) => lightColorScheme(color: color);
}
