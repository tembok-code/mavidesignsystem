//
import 'package:flutter/material.dart';

const double spacing_lg = 24;
const double spacing_md = 14;
const double spacing_sm = 8;
const double margin_lg = 42;
//
//
const double radius_container = spacing_sm;
const double radius_content = spacing_sm * 0.5;
const double radius_button = spacing_sm;
//
//
const double button_height_sm = 32;
const double button_height_md = 40;
const double button_height_lg = 48;
//
//
Widget maviThemeSpacer({double size = spacing_md}) => SizedBox(height: size);
Widget maviThemeVerticalSpacer({double size = spacing_md}) =>
    SizedBox(width: size);

//