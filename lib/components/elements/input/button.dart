import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

enum ButtonVariant { plain, solid, outlined, soft }

enum ButtonSize { sm, md, lg }

extension ButtonSizeValue on ButtonSize {
  double value() {
    switch (this) {
      case ButtonSize.sm:
        return button_height_sm;
      case ButtonSize.lg:
        return button_height_lg;
      default:
        return button_height_md;
    }
  }
}

class MButton extends StatefulWidget {
  const MButton({
    super.key,
    this.variant,
    this.leading,
    this.tailing,
    this.label,
    this.onTap,
    this.isExpanded = false,
    this.disabled = false,
    this.size = ButtonSize.md,
    this.loading = false,
  });
  final ButtonVariant? variant;
  final String? label;
  final IconData? leading;
  final IconData? tailing;
  final Function? onTap;
  final bool isExpanded;
  final bool disabled;
  final ButtonSize size;
  final bool loading;

  @override
  State<MButton> createState() => _MButtonState();
}

class _MButtonState extends State<MButton> {
  double _maxWidth = 100;
  final double _minWidth = button_height_md;
  bool _disabled = false;
  ButtonVariant _variant = ButtonVariant.solid;
  //
  bool isHovered = false;
  //
  @override
  void initState() {
    _maxWidth = widget.isExpanded ? double.maxFinite : _maxWidth;

    super.initState();
  }

  void updateWidth() {
    var __padding = spacing_md * 2;
    var __label = (widget.label ?? '').length * MaviTextTheme().bodyFontSize;
    var __icons =
        ((widget.leading != null ? 1 : 0) + (widget.tailing != null ? 1 : 0)) *
            widget.size.value();
    var __loading = (widget.loading ? 1 : 0) * widget.size.value();
    _maxWidth = __padding + __label + __icons + __loading;
  }

  void setHover(bool value) => setState(() => isHovered = value);

  @override
  Widget build(BuildContext context) {
    //
    _variant = widget.variant ?? _variant;
    if (widget.loading) _variant = ButtonVariant.soft; //
    //
    _disabled = widget.disabled;
    if (!_disabled && (widget.onTap == null || widget.loading)) {
      _disabled = true;
    }
    updateWidth();
    //
    var colorScheme = Theme.of(context).colorScheme;
    Color colorPrimary = colorScheme.primary;
    var isDark = colorScheme.brightness == Brightness.dark;
    //
    Color _bgColor = colorPrimary;
    Color _bgHoverColor = MaviTheme().colorTheme.primaryShades.shade700;
    Color _labelColor = colorScheme.onPrimary;
    Color _splashColor = MaviTheme().colorTheme.primaryShades.shade800;
    Color? _borderColor = null;
    //
    switch (_variant) {
      case ButtonVariant.soft:
        _bgColor = isDark
            ? MaviTheme().colorTheme.primaryShades.shade800
            : MaviTheme().colorTheme.primaryShades.shade200;
        _bgHoverColor = MaviTheme().colorTheme.primaryShades.shade200;
        _labelColor = isDark
            ? MaviTheme().colorTheme.primaryShades.shade200
            : colorScheme.primary;
        _splashColor = MaviTheme().colorTheme.primaryShades.shade300;
        break;
      case ButtonVariant.outlined:
        _bgColor = colorScheme.background;
        _bgHoverColor = isDark
            ? MaviTheme().colorTheme.primaryShades.shade700
            : MaviTheme().colorTheme.primaryShades.shade200;
        _labelColor = colorScheme.primary;
        _splashColor = MaviTheme().colorTheme.primaryShades.shade300;
        _borderColor = colorScheme.primary;
        break;
      case ButtonVariant.plain:
        _bgColor = colorScheme.background;
        _bgHoverColor = isDark
            ? MaviTheme().colorTheme.primaryShades.shade700
            : MaviTheme().colorTheme.primaryShades.shade200;
        _labelColor = colorScheme.primary;
        _splashColor = MaviTheme().colorTheme.primaryShades.shade300;
        break;
      default:
    }
    //
    //
    switch (_disabled) {
      case true:
        _bgColor = widget.loading ? _bgColor : _bgColor.withAlpha(100);
        _labelColor = widget.loading ? _labelColor : _labelColor.withAlpha(100);
        _borderColor = _borderColor?.withAlpha(100);
        break;
      default:
        break;
    }
    //
    //
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          constraints: BoxConstraints(
            maxWidth: _maxWidth,
            minWidth: _minWidth,
          ),
          height: widget.size.value(),
          decoration: BoxDecoration(
              color: isHovered ? _bgHoverColor : _bgColor,
              borderRadius: BorderRadius.circular(radius_button),
              border: _borderColor == null
                  ? null
                  : Border.all(color: _borderColor)),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius_button),
            child: InkWell(
              onTap: _disabled ? null : () => widget.onTap,
              onHover: (value) => setHover(value),
              splashColor: _splashColor,
              borderRadius: BorderRadius.circular(radius_button),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.loading
                      ? [
                          SizedBox.square(
                            dimension: widget.size.value() - (spacing_sm * 2),
                            child: CircularProgressIndicator(
                              color: _labelColor,
                            ),
                          )
                        ]
                      : [
                          if (widget.leading != null)
                            Icon(widget.leading, color: _labelColor),
                          if (widget.leading != null && widget.label != null)
                            maviThemeVerticalSpacer(size: spacing_sm),
                          if (widget.label != null)
                            MaviTextTheme()
                                .buttonText(text: widget.label)
                                .copyWith(newColor: _labelColor),
                          if (widget.tailing != null && widget.label != null)
                            maviThemeVerticalSpacer(size: spacing_sm),
                          if (widget.tailing != null)
                            Icon(widget.tailing, color: _labelColor),
                        ],
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
