import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

class MText extends StatelessWidget {
  const MText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.overFlow,
  });

  final String? text;
  final MaviTextStyles? style;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    MaviTextStyles _style = style ?? MaviTextStyles.body;
    var __style = _style.style;
    __style = __style.copyWith(
      color: color ?? __style.color,
      fontWeight: fontWeight ?? __style.fontWeight,
      fontSize: fontSize ?? __style.fontSize,
      overflow: overFlow ?? __style.overflow,
    );
    String _text = text ?? 'Text';
    _text = _style.upperCase ? _text.toUpperCase() : _text;
    return Text(
      _text,
      style: __style,
    );
    return _style.widget(text, color: color);
  }
}
