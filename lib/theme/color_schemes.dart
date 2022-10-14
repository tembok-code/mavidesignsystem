import 'package:flutter/material.dart';

//*REDDEL COLOR
class PrimaryColor {
  get name => "Rio Grande";
  get color => shade500;
  //
  Color get shade50 => const Color(0xFFfdffe4);
  Color get shade100 => const Color(0xFFf8ffc5);
  Color get shade200 => const Color(0xFFeeff92);
  Color get shade300 => const Color(0xFFe0ff53);
  Color get shade400 => const Color(0xFFcdfb20);
  Color get shade500 => const Color(0xFFa6d700);
  Color get shade600 => const Color(0xFF86b500);
  Color get shade700 => const Color(0xFF668902);
  Color get shade800 => const Color(0xFF516C08);
  Color get shade900 => const Color(0xFF445b0c);
}

var lightColorScheme = ColorScheme.fromSeed(
    seedColor: PrimaryColor().shade500,
    brightness: Brightness.light,
    primary: PrimaryColor().shade600,
    surface: PrimaryColor().shade50);

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

var darkColorScheme = ColorScheme.fromSeed(
  seedColor: PrimaryColor().shade500,
  brightness: Brightness.dark,
);
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
