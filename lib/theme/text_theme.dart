import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaviTextTheme {
//
  final bodyFontSize = 12.0;
  double getSize(double factor) => (bodyFontSize * factor).truncateToDouble();
//
  TextOverflow overflow = TextOverflow.fade;
//

  TextStyle headingStyle({FontWeight? fontWeight = FontWeight.bold}) =>
      GoogleFonts.poppins(fontWeight: fontWeight);
  TextStyle bodyStyle({FontWeight? fontWeight = FontWeight.normal}) =>
      GoogleFonts.hind(fontWeight: fontWeight);

//* HEADINGS
  MaviThemeTextWidget h1({String? text}) => MaviThemeTextWidget(
      text: text, style: headingStyle(), sizeFactor: 54 / 16);
  MaviThemeTextWidget h2({String? text}) => MaviThemeTextWidget(
      text: text, style: headingStyle(), sizeFactor: 32 / 16);
  MaviThemeTextWidget h3({String? text}) => MaviThemeTextWidget(
      text: text, style: headingStyle(), sizeFactor: 24 / 16);
  MaviThemeTextWidget h4({String? text}) => MaviThemeTextWidget(
      text: text,
      style: headingStyle(fontWeight: FontWeight.w600),
      sizeFactor: 21 / 16);
  MaviThemeTextWidget subtitle({String? text}) => MaviThemeTextWidget(
      text: text,
      style: headingStyle(fontWeight: FontWeight.w300),
      sizeFactor: 24 / 16);
  MaviThemeTextWidget buttonText({String? text}) => MaviThemeTextWidget(
        text: text,
        style: headingStyle(fontWeight: FontWeight.w600),
        upperCase: true,
      );
  MaviThemeTextWidget overline({String? text}) => MaviThemeTextWidget(
      text: text,
      style: headingStyle().copyWith(letterSpacing: 2),
      upperCase: true,
      color: Colors.black26,
      sizeFactor: 14 / 16);
//
//* BODY
  TextAlign _bodyAlign = TextAlign.justify;
  MaviThemeTextWidget bodyBig({String? text}) => MaviThemeTextWidget(
      text: text, style: bodyStyle(), align: _bodyAlign, sizeFactor: 18 / 16);
  MaviThemeTextWidget body({String? text}) =>
      MaviThemeTextWidget(text: text, style: bodyStyle(), align: _bodyAlign);
  MaviThemeTextWidget bodyBold({String? text}) => MaviThemeTextWidget(
      text: text,
      style: bodyStyle(fontWeight: FontWeight.bold),
      align: _bodyAlign);
  MaviThemeTextWidget bodySmall({String? text}) => MaviThemeTextWidget(
      text: text, style: bodyStyle(), align: _bodyAlign, sizeFactor: 14 / 16);
  MaviThemeTextWidget bodySmallBold({String? text}) => MaviThemeTextWidget(
      text: text,
      style: bodyStyle(fontWeight: FontWeight.bold),
      align: _bodyAlign,
      sizeFactor: 14 / 16);

//
}

class MaviThemeTextWidget extends Text {
  const MaviThemeTextWidget(
      {super.key,
      this.text,
      required this.style,
      this.upperCase = false,
      this.color,
      this.align = TextAlign.left,
      this.sizeFactor = 1})
      : super('');
  final String? text;
  final TextStyle style;
  final bool upperCase;
  final Color? color;
  final double sizeFactor;
  final TextAlign align;

  get getStyle => style.copyWith(
      color: color ?? style.color,
      fontSize: MaviTextTheme().getSize(sizeFactor),
      fontWeight: style.fontWeight ?? FontWeight.normal);

  Text textWidget({String? text}) {
    String _text = text ?? 'Text';
    _text = upperCase ? _text.toUpperCase() : _text;

    return Text(
      _text,
      textAlign: align,
      style: getStyle,
    );
  }

  MaviThemeTextWidget copyWith({TextStyle? newStyle, Color? newColor}) =>
      MaviThemeTextWidget(
        text: text,
        style: newStyle ?? getStyle,
        color: newColor ?? color,
      );

  @override
  Widget build(BuildContext context) {
    return textWidget(text: text);
  }
}
