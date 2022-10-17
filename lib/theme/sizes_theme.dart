//
import 'package:flutter/material.dart';

//
enum MSize { sm, md, lg }

/// Mavi Theme Sizes

//
const double spacing_lg = 24;
const double spacing_md = 14;
const double spacing_sm = 8;
const double margin_lg = 42;

extension SpacingExtension on MSize {
  double get spacing {
    switch (this) {
      case MSize.lg:
        return spacing_lg;
      case MSize.sm:
        return spacing_sm;
      default:
        return spacing_md;
    }
  }
}

//
//
const double radius_container = spacing_sm;
const double radius_content = spacing_sm * 0.5;
const double radius_modal = radius_container * 2;
const double radius_button = spacing_sm;

extension RadiusExtension on MSize {
  double get radius {
    switch (this) {
      case MSize.lg:
        return radius_modal;
      case MSize.md:
        return radius_container;
      default:
        return radius_content;
    }
  }
}

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