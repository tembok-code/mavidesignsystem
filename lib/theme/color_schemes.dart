import 'package:flutter/material.dart';
//
import '../../globals.dart' as globals;
//
import './color_theme.dart';

/// This class ensures that app color scheme is compatible with
/// Material [ColorScheme] pallet so build in components looks good with
/// our custom implementation.
/// Thanks to https://fivedottwelve.com/blog/themes-in-flutter-and-how-to-use-material-you-dynamic-colors/
/// for the class

extension SchemeExtensions on ColorScheme {
  MaterialColor get primarySwatch =>
      primary.generateMaterialColor(brightness: brightness);
  MaterialColor get secondarySwatch =>
      secondary.generateMaterialColor(brightness: brightness);
  MaterialColor get neutralSwatch =>
      outline.generateMaterialColor(brightness: brightness);
  //
  ColorScheme get light => globals.palette.colorScheme.light;
  ColorScheme get dark => globals.palette.colorScheme.dark;
  ColorScheme get solid => globals.brightness == Brightness.light
      ? globals.palette.colorScheme.lightSolid
      : globals.palette.colorScheme.darkSolid;
  ColorScheme get soft => globals.brightness == Brightness.light
      ? globals.palette.colorScheme.lightSoft
      : globals.palette.colorScheme.darkSoft;
  ColorScheme get outlined => globals.brightness == Brightness.light
      ? globals.palette.colorScheme.lightOutlined
      : globals.palette.colorScheme.darkOutlined;
  ColorScheme get plain => globals.brightness == Brightness.light
      ? globals.palette.colorScheme.lightPlain
      : globals.palette.colorScheme.darkPlain;
  //* States Colors
  static Color hover = Colors.blue;
  static Color pressed = Colors.blue;
  static Color? border;
}

//* MAVI COLOR SCHEME CLASS
class MaviColorScheme {
  final Color primaryColor;
  final String name;
  final ColorScheme? replaceLight;
  //
  late MaterialColor color;
  late ColorScheme light;
  late ColorScheme dark;
  //
  late ColorScheme lightSolid;
  late ColorScheme darkSolid;
  //
  late ColorScheme lightSoft;
  late ColorScheme darkSoft;
  //
  late ColorScheme lightOutlined;
  late ColorScheme darkOutlined;
  //
  late ColorScheme lightPlain;
  late ColorScheme darkPlain;
  //

  MaviColorScheme({
    this.name = 'Denim',
    this.primaryColor = const Color(0xFF195bdb),
    this.replaceLight,
  }) {
    color = primaryColor.generateMaterialColor();
    light = lightScheme;
    dark = darkScheme;
    //
    lightSolid = lightSolidScheme;
    darkSolid = darkSolidScheme;
    //
    lightSoft = lightSoftScheme;
    darkSoft = darkSoftScheme;
    //
    lightOutlined = lightOutlinedScheme;
    darkOutlined = darkOutlinedScheme;
    //
    lightPlain = lightPlainScheme;
    darkPlain = darkPlainScheme;
  }

  //* To generate a Mavi Scheme with a givven Primary Color
  MaviColorScheme withPrimary(Color color) =>
      MaviColorScheme(primaryColor: color);
  //set withPrimary(Color value) => primaryColor = value;
  //@required
  String get getName => name;
  //@required
  //static const primaryColor = Color(0xFF195bdb);

  // static final MaterialColor colorCalc = primaryColor.generateMaterialColor();

  //* MAIN COLOR THEME

  ColorScheme get lightScheme {
    var s = replaceLight;
    return ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
      //
      //
      primary: s?.primary ?? color.shade500,
      onPrimary: s?.onPrimary ??
          (color.lightness < 0.5 ? color.shade800 : color.shade100),
      background: s?.background,
      onBackground: s?.onBackground,
    );
  }

  ColorScheme get darkScheme => ColorScheme.fromSeed(
        seedColor: color,
        brightness: Brightness.dark,
        //
        //
        primary: color.shade300,
      );

  //*** */ BUTTONS THEMES
  // primary: bg, primaryContainer: hover,onPrimaryContainer: pressed, outline: border
  //* SOLID COLOR THEME
  ColorScheme get lightSolidScheme => light.copyWith(
        primaryContainer: color.shade600,
        onPrimaryContainer: color.shade700,
        outline: Colors.transparent,
      );

  ColorScheme get darkSolidScheme => dark.copyWith(
        primary: color.shade700,
        onPrimary: color.shade50,
        primaryContainer: color.shade800,
        onPrimaryContainer: color.shade900,
        outline: Colors.transparent,
      );

  //* SOFT COLOR THEME
  ColorScheme get lightSoftScheme => light.copyWith(
        primary: color.shade100,
        onPrimary: color.shade600,
        primaryContainer: color.shade200,
        onPrimaryContainer: color.shade300,
        outline: Colors.transparent,
      );

  ColorScheme get darkSoftScheme => light.copyWith(
        primary: light.onPrimaryContainer,
        onPrimary: light.primaryContainer,
        primaryContainer: color.shade900,
        onPrimaryContainer: color.shade700,
        outline: Colors.transparent,
      );

  //* OUTLINED COLOR THEME
  ColorScheme get lightOutlinedScheme => light.copyWith(
        primary: light.background,
        onPrimary: color,
        primaryContainer: color.shade100,
        onPrimaryContainer: color.shade200,
        outline: color.shade200,
      );

  ColorScheme get darkOutlinedScheme => dark.copyWith(
        primary: dark.background,
        onPrimary: dark.primary,
        primaryContainer: color.shade900,
        onPrimaryContainer: light.onPrimaryContainer,
        outline: dark.primaryContainer,
      );

  //* PLAIN COLOR THEME
  ColorScheme get lightPlainScheme => light.copyWith(
        primary: light.background,
        onPrimary: color.shade600,
        primaryContainer: color.shade100,
        onPrimaryContainer: color.shade200,
        outline: Colors.transparent,
      );

  ColorScheme get darkPlainScheme => light.copyWith(
        primary: dark.background,
        onPrimary: dark.primary,
        primaryContainer: color.shade900,
        onPrimaryContainer: light.onPrimaryContainer,
        outline: Colors.transparent,
      );

  /*  MaterialColor _colorWithShades() => MaterialColor(primaryColor.value, const {
        50: Color(0xffEFF7FF),
        100: Color(0xffDAEDFF),
        200: Color(0xffBEE0FF),
        300: Color(0xff91CEFF),
        400: Color(0xff5DB2FD),
        500: Color(0xff3790FA),
        600: Color(0xff2171EF),
        700: Color(0xff195BDB),
        800: Color(0xff1B4AB2),
        900: Color(0xff1C428C),
      }); */

}

//** */ PREDEFINED PALETTES
//* Mavi
final _maviColor = const Color(0xFF195bdb).generateMaterialColor();
final MaviColorScheme maviColorScheme = MaviColorScheme(
    replaceLight: ColorScheme.fromSeed(
  seedColor: _maviColor,
  background: const Color(0xFFfefbff),
  onBackground: const Color(0xFF1b1b1f),
));
//* Reddel
final MaviColorScheme reddelColorScheme =
    MaviColorScheme(primaryColor: const Color(0xFFa6d700));
