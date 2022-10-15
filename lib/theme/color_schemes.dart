import 'package:flutter/material.dart';

/// This class ensures that app color scheme is compatible with
/// Material [ColorScheme] pallet so build in components looks good with
/// our custom implementation.
/// Thanks to https://fivedottwelve.com/blog/themes-in-flutter-and-how-to-use-material-you-dynamic-colors/
/// for the class

//* MAVI COLOR
class MaviColorScheme {
  @required
  String get name => 'mavi';
  @required
  Color get primaryColor => const Color(0xFF195bdb);

  MaterialColor get color => _createMaterialColor();

//* SOLID COLOR THEME
  ColorScheme get light => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        //
        //
        primary: primaryColor,
      );
  ColorScheme get dark => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        //
        //
        primary: color.shade300,
      );

  //* SOFT COLOR THEME
  ColorScheme get lightSoft => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        //
        //
        primary: color.shade50,
        onPrimary: color,
        primaryContainer: color.shade200,
        onPrimaryContainer: color.shade50,
      );
  ColorScheme get darkSoft => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        //
        //
        primary: color.shade900,
        onPrimary: color.shade100,
        primaryContainer: color.shade700,
        onPrimaryContainer: color.shade800,
      );

  //* OUTLINED COLOR THEME
  ColorScheme get lightOutlined => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        //
        //
        primary: light.background,
        onPrimary: primaryColor,
        primaryContainer: color.shade200,
        onPrimaryContainer: primaryColor,
      );
  ColorScheme get darkOutlined => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        //
        //
        primary: dark.background,
        onPrimary: color.shade200,
        primaryContainer: color.shade700,
        onPrimaryContainer: color.shade200,
      );

  //* PLAIN COLOR THEME
  ColorScheme get lightPlain => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        //
        //
        primary: light.background,
        onPrimary: primaryColor,
        primaryContainer: color.shade200,
        onPrimaryContainer: light.background,
      );
  ColorScheme get darkPlain => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        //
        //
        primary: dark.background,
        onPrimary: primaryColor,
        primaryContainer: color.shade700,
        onPrimaryContainer: dark.background,
      );

  MaterialColor _createMaterialColor() {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = primaryColor.red,
        g = primaryColor.green,
        b = primaryColor.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(primaryColor.value, swatch);
  }
}

//*REDDEL COLOR
class ReddelColorScheme extends MaviColorScheme {
  @override
  String get name => "Rio Grande";
  @override
  Color get primaryColor => const Color(0xFFa6d700);

  @override
  ColorScheme get light => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        //
        primary: color.shade600,
        surface: color.shade50,
      );
  @override
  ColorScheme get dark => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        //
      );

/*   @override
  Map<int, Color> primaryShade = {
    50: const Color(0xFFfdffe4),
    100: const Color(0xFFf8ffc5),
    200: const Color(0xFFeeff92),
    300: const Color(0xFFe0ff53),
    400: const Color(0xFFcdfb20),
    500: const Color(0xFFa6d700),
    600: const Color(0xFF86b500),
    700: const Color(0xFF668902),
    800: const Color(0xFF516C08),
    900: const Color(0xFF445b0c),
  }; */
}

/* const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 170, 207, 49),
  onPrimary: Color(0xFF273500),
  primaryContainer: Color(0xFF3A4D00),
  onPrimaryContainer: Color(0xFFBEF500),
  secondary: Color(0xFF006875),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF9CF0FF),
  onSecondaryContainer: Color(0xFF001F24),
  tertiary: Color(0xFF39665F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBCECE3),
  onTertiaryContainer: Color(0xFF00201C),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFCF4),
  onBackground: Color(0xFF1B1C17),
  surface: Color(0xFFFEFCF4),
  onSurface: Color(0xFF1B1C17),
  surfaceVariant: Color(0xFFE2E4D4),
  onSurfaceVariant: Color(0xFF45483C),
  outline: Color(0xFF76786B),
  onInverseSurface: Color(0xFFF2F1E9),
  inverseSurface: Color(0xFF30312C),
  inversePrimary: Color(0xFFA6D700),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4E6700),
);
 */


/* 
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFA6D700),
  onPrimary: Color(0xFF273500),
  primaryContainer: Color(0xFF3A4D00),
  onPrimaryContainer: Color(0xFFBEF500),
  secondary: Color(0xFF00DAF3),
  onSecondary: Color(0xFF00363D),
  secondaryContainer: Color(0xFF004F58),
  onSecondaryContainer: Color(0xFF9CF0FF),
  tertiary: Color(0xFFA1D0C7),
  onTertiary: Color(0xFF023731),
  tertiaryContainer: Color(0xFF204E48),
  onTertiaryContainer: Color(0xFFBCECE3),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1C17),
  onBackground: Color(0xFFE4E3DB),
  surface: Color(0xFF1B1C17),
  onSurface: Color(0xFFE4E3DB),
  surfaceVariant: Color(0xFF45483C),
  onSurfaceVariant: Color(0xFFC6C8B8),
  outline: Color(0xFF909284),
  onInverseSurface: Color(0xFF1B1C17),
  inverseSurface: Color(0xFFE4E3DB),
  inversePrimary: Color(0xFF4E6700),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFA6D700),
); */
