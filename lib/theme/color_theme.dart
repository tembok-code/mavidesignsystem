import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

export 'color_schemes.dart';

enum MaviPaletteOptions { mavi, reddel }

extension MaviThemePaletteOptions on MaviPaletteOptions {
  MaviColorScheme get colorScheme {
    switch (this) {
      case MaviPaletteOptions.reddel:
        return reddelColorScheme;
      default:
        return maviColorScheme;
    }
  }
}

extension ColorExtensions on Color {
  MaterialColor generateMaterialColor({Brightness? brightness}) {
    Map<int, double> range = {
      50: 0.9545,
      100: 0.95,
      200: 0.95,
      300: 0.9409,
      400: 0.9454,
      500: 0.9681,
      600: 0.9863,
      700: 1,
      800: 1.0045,
      900: 1
    }; // id : hue factor percentail (0-1)
    Map<int, Color> calculated = {};
    bool isDark = brightness == Brightness.dark;
    int i = isDark ? range.length - 1 : 0;
    range.forEach((key, value) {
      calculated.addAll({key: tintColorWithHLSFactor(value, i)});
      isDark ? i-- : i++;
    });
    return MaterialColor(value, calculated);
/*     return MaterialColor(value, {
      50: tintColorWithHLS(1, 0.97),
      //50: tintColor(0.9),
      100: tintColorWithHLS(1, 0.93),
      //100: tintColor(0.8),
      200: tintColor(0.6),
      300: tintColor(0.4),
      400: tintColorWithHLS(0.98, 0.68),
      //400: tintColor(0.2),
      500: this,
      600: shadeColor(0.1),
      700: shadeColor(0.2),
      800: shadeColor(0.3),
      900: shadeColor(0.4),
    }); */
  }

  double get lightness => HSLColor.fromColor(this).lightness;
//
  Color tintColorWithHLSFactor(double hueFactor, int index) {
    var hsl = HSLColor.fromColor(this);
    int midIndex = 5;
    double position = 10 / 5;

    var h = hsl.hue * hueFactor;
    hsl = hsl.withHue((h).clamp(0, 360).roundToDouble());
    print(hsl.lightness);

    var s = index <= midIndex
        ? lerpDouble(hsl.saturation * 1.2, hsl.saturation, index / midIndex)
        : lerpDouble(hsl.saturation, hsl.saturation * 0.8,
            (index - midIndex) / (10 - midIndex));
    hsl = hsl.withSaturation((s ?? hsl.saturation).clamp(0, 1));

    var l = index <= midIndex
        ? lerpDouble(0.97, hsl.lightness, index / midIndex)
        : lerpDouble(hsl.lightness, hsl.lightness * 0.3,
            (index - midIndex) / (10 - midIndex));
    hsl = hsl.withLightness((l ?? hsl.lightness).clamp(0, 1));
    //hls = hls.withSaturation(s);
    return hsl.toColor();
  }

  Color tintColorWithHLS(double s, double l) {
    var hsl = HSLColor.fromColor(this);
    var hue = hsl.hue;
    var range = (360 / 4) * hsl.saturation * hsl.lightness;
    hsl = hsl.withHue((hue - (range * 0.5)).clamp(0, 360).roundToDouble());
    hsl = hsl.withLightness(l);
    hsl = hsl.withSaturation(s);
    return hsl.toColor();
  }

//
  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(double factor) => Color.fromRGBO(tintValue(red, factor),
      tintValue(green, factor), tintValue(blue, factor), 1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(double factor) => Color.fromRGBO(shadeValue(red, factor),
      shadeValue(green, factor), shadeValue(blue, factor), 1);
}
