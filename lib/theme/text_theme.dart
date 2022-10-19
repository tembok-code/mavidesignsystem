import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double bodyFontSize = 12.0; //TODO: Allow font size change from Provider

double _getSize(double factor) => (bodyFontSize * factor).truncateToDouble();

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
  final FontWeight fontWeight;
  final double? letterSpacing;
  final bool upperCase;
  final double sizeFactor;
  final Color? color;

  const MaviTextStyles(
      {this.isHeading = false,
      this.fontWeight = FontWeight.normal,
      this.letterSpacing,
      this.upperCase = false,
      this.sizeFactor = bodyFontSize / 16,
      this.color});

// Default Body and Heading Styles and fonts
  static TextStyle headingStyle({FontWeight? fontWeight = FontWeight.bold}) =>
      GoogleFonts.poppins(fontWeight: fontWeight);
  static TextStyle bodyStyle({FontWeight? fontWeight = FontWeight.normal}) =>
      GoogleFonts.hind(fontWeight: fontWeight);

  TextStyle get style {
    TextStyle _style = isHeading
        ? headingStyle(fontWeight: fontWeight)
        : bodyStyle(fontWeight: fontWeight);
    double _size = _getSize(sizeFactor);
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
