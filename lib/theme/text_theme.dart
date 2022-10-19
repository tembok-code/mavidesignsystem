import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaviTextTheme {
  final double fontSize;
  MaviTextTheme({this.fontSize = 12}) : bodyFontSize = fontSize;

  late double bodyFontSize;

  //TODO: Allow font size change from Provider

// Default Body and Heading Styles and fonts
  TextStyle headingStyle({FontWeight? fontWeight}) =>
      GoogleFonts.poppins(fontWeight: fontWeight ?? FontWeight.bold);
  TextStyle bodyStyle({FontWeight? fontWeight}) =>
      GoogleFonts.hind(fontWeight: fontWeight ?? FontWeight.normal);
  //

  double getSize(double factor) => (bodyFontSize * factor).truncateToDouble();
}

enum MaviTextStyles {
  // Default Text Styles
  h1(isHeading: true, sizeFactor: 54 / 16),
  h2(isHeading: true, sizeFactor: 32 / 16),
  h3(isHeading: true, sizeFactor: 24 / 16),
  h4(isHeading: true, fontWeight: FontWeight.w600, sizeFactor: 21 / 16),
  subtitle(isHeading: true, fontWeight: FontWeight.w300, sizeFactor: 24 / 16),
  buttonText(isHeading: true, fontWeight: FontWeight.w600, upperCase: true),
  overline(
      isHeading: true,
      letterSpacing: 2,
      upperCase: true,
      color: Colors.black26,
      sizeFactor: 14 / 16),
  bodyBig(sizeFactor: 18 / 16),
  body(),
  bodySmall(sizeFactor: 14 / 16);

  final bool isHeading;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final bool upperCase;
  final double? sizeFactor;
  final Color? color;

  const MaviTextStyles(
      {this.isHeading = false,
      this.fontWeight,
      this.letterSpacing,
      this.upperCase = false,
      this.sizeFactor,
      this.color});

  TextStyle get style {
    TextStyle _style = isHeading
        ? MaviTextTheme().headingStyle(fontWeight: fontWeight)
        : MaviTextTheme().bodyStyle(fontWeight: fontWeight);
    double _size = MaviTextTheme().getSize(sizeFactor ?? 1);
    return _style.copyWith(
      fontSize: _size,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  Widget widget(String? text, {Color? color}) {
    String _text = text ?? "Text";
    _text = upperCase ? _text.toUpperCase() : _text;
    return Text(
      _text,
      style: style.copyWith(color: color),
    );
  }
}
