import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import '../globals.dart' as globals;
import '../theme/theme.dart';

//
class MMaterialApp extends StatelessWidget {
  const MMaterialApp({
    super.key,
    //required this.context,
    this.palette,
    //
    this.scrollBehavior,
    this.themeMode,
    this.title = '',
    required this.home,
  });
  //final BuildContext context;
  final MaviPaletteOptions? palette;
  //
  final ThemeMode? themeMode;
  final ScrollBehavior? scrollBehavior;
  final String title;
  final Widget home;
  //

  //
  @override
  Widget build(BuildContext context) {
    globals.palette = palette ?? MaviPaletteOptions.mavi;
    globals.themeData = MaviTheme().themeData();
    globals.brightness = (themeMode ?? ThemeMode.light) == ThemeMode.light
        ? Brightness.light
        : Brightness.dark;
    //
    var _themeMode = themeMode ??
        (globals.brightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark);

    return ChangeNotifierProvider(
      create: (context) => MaviThemeProvider(
          initialMode: _themeMode, initialPalette: globals.palette),
      builder: (context, child) {
        //
        var currentMode = context.watch<MaviThemeProvider>().mode;
        //
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: scrollBehavior,
          //
          theme: MaviTheme().themeData(overrideBrightness: Brightness.light),
          darkTheme: MaviTheme().themeData(overrideBrightness: Brightness.dark),
          themeMode: currentMode,
          //
          title: title,
          home: home,
        );
      },
    );
  }
}
