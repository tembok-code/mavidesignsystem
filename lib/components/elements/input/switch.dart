import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/components.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

class MSwitch extends StatefulWidget {
  const MSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = ButtonSize.sm,
    this.variant = ButtonVariant.solid,
    this.onIcon,
    this.offIcon,
  });
  final bool value;
  final Function(bool value) onChanged;
  final ButtonSize size;
  final ButtonVariant variant;
  final IconData? onIcon;
  final IconData? offIcon;

  @override
  State<MSwitch> createState() => _MSwitchState();
}

class _MSwitchState extends State<MSwitch> {
  //
  late double height;
  late double width;
  double padding = spacing_sm * 0.5;
  //
  bool state = false;
  bool hovered = false;

  void toggleState() {
    //setState(() => state = !state);
    widget.onChanged(!state);
  }

  void setHover(bool value) => setState(() => hovered = value);

  @override
  Widget build(BuildContext context) {
    //
    height = widget.size.value() * 0.75;
    double circleRadius = height * 0.5 - padding;
    width = (circleRadius * 2) * 2.5;
    //
    state = widget.value;
    //
    var theme = Theme.of(context);
    var scheme = widget.variant.colorScheme;
    var neutralSwatch = theme.colorScheme.neutralSwatch;
    //
    Color _bgColor = scheme.primary;
    Color _circleColor = scheme.onPrimary;
    Color _borderColor = scheme.outline;
    //
    switch (state) {
      case false:
        if (widget.variant != ButtonVariant.outlined &&
            widget.variant != ButtonVariant.plain)
          _bgColor = neutralSwatch.shade400;
        _circleColor = widget.variant != ButtonVariant.outlined &&
                widget.variant != ButtonVariant.plain
            ? neutralSwatch.shade50
            : neutralSwatch.shade400;
        _borderColor = widget.variant == ButtonVariant.outlined
            ? neutralSwatch.shade100
            : _borderColor;
        break;
      default:
    }
    switch (hovered) {
      case true:
        _bgColor = scheme.primaryContainer;
        _circleColor = scheme.onPrimary;
        break;
      default:
        break;
    }

    //
    return InkWell(
      onTap: (() => toggleState()),
      onHover: (value) => setHover(value),
      borderRadius: BorderRadius.circular(widget.size.value() * 0.5),
      child: Stack(
        children: [
          AnimatedContainer(
            duration:
                Duration(milliseconds: 250), //TODO: CREATE SYSTEM DURATIONS
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: _bgColor, //TODO: set variant colors
              border: Border.all(color: _borderColor),
              borderRadius: BorderRadius.circular(widget.size.value() * 0.5),
            ),
          ),
          if (widget.offIcon != null)
            Positioned(
              left: padding,
              top: 0,
              bottom: 0,
              child: Icon(
                widget.offIcon,
                size: circleRadius * 1.5,
                color: _circleColor,
              ),
            ),
          if (widget.onIcon != null)
            Positioned(
              right: padding,
              top: 0,
              bottom: 0,
              child: Icon(
                widget.onIcon,
                size: circleRadius * 1.5,
                color: _circleColor,
              ),
            ),
          AnimatedPositioned(
            duration:
                Duration(milliseconds: 250), //TODO: CREATE SYSTEM DURATIONS
            top: padding, bottom: padding,
            width: circleRadius * 2,
            left: !state ? padding : width - padding - circleRadius * 2,
            child: AnimatedContainer(
              duration:
                  Duration(milliseconds: 250), //TODO: CREATE SYSTEM DURATIONS
              decoration: BoxDecoration(
                  color: _circleColor,
                  borderRadius: BorderRadius.circular(circleRadius)),
            ),
          )
        ],
      ),
    );
  }
}
