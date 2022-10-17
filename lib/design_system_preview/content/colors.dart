import 'package:flutter/material.dart';
//
import '../../globals.dart' as globals;
//
import '../../theme/theme.dart';
import '../components/components_preview.dart';

class ContentColors extends StatelessWidget {
  const ContentColors({super.key});

  @override
  Widget build(BuildContext context) {
    //
    var currentTheme = Theme.of(context);
    var colorScheme = currentTheme.colorScheme;
    //
    String title = "Colors";
    //
    return CustomScrollView(
      slivers: [
        SectionWidget(title: "$title - Schemes", slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaviTextTheme().h2(text: title),
                        maviThemeSpacer(),
                        Container(
                            color: colorScheme.primary, height: 2, width: 50),
                        maviThemeSpacer(),
                        MaviTextTheme().body(
                            text:
                                'As a web font you should use Poppins for all headlines and Hind for body text. Every graphic design artwork should be made using these two fonts.'),
                      ],
                    ),
                  ),
                  maviThemeVerticalSpacer(size: spacing_lg),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaviTheme().textTheme.h4(text: 'Light'),
                              _ColorThemeGrid(scheme: colorScheme.light),
                            ],
                          ),
                        ),
                        maviThemeVerticalSpacer(size: spacing_lg),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaviTheme().textTheme.h4(text: 'Dark'),
                              _ColorThemeGrid(scheme: colorScheme.dark),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
        SectionWidget(title: "$title - Swatches", slivers: [
          /* SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: MaviTheme().textTheme.h4(text: 'Primary (UIColors.app)'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: _ColorSwatchRow(color: MaviTheme().color),
            ),
          ), */
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: MaviTheme().textTheme.h4(text: 'Primary (Calculated)'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: _ColorSwatchRow(color: colorScheme.primarySwatch),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: MaviTheme().textTheme.h4(text: 'Secondary'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: _ColorSwatchRow(color: colorScheme.secondarySwatch),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: MaviTheme().textTheme.h4(text: 'Neutral'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: _ColorSwatchRow(color: colorScheme.neutralSwatch),
            ),
          ),
        ]),
      ],
    );
  }
}

class _ColorThemeGrid extends StatelessWidget {
  const _ColorThemeGrid({super.key, required this.scheme});
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    const double height_lg = spacing_lg * 4;
    const double height_sm = spacing_lg * 2;

    Widget _colorContainer(Color primary, Color onPrimary, String name,
            {double height = height_sm}) =>
        Container(
          color: primary,
          height: height,
          padding: const EdgeInsets.all(spacing_sm),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: MaviTheme()
                      .textTheme
                      .bodySmallBold()
                      .apply(newColor: onPrimary)
                      .getStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  height: spacing_sm,
                  decoration: BoxDecoration(
                      color: onPrimary,
                      borderRadius: BorderRadius.circular(radius_content)),
                ),
              ],
            ),
          ),
        );
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius_container),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              [scheme.primary, scheme.onPrimary, "Primary"],
              [scheme.primaryContainer, scheme.onPrimaryContainer, "Container"],
            ]
                .map((dynamic e) => Expanded(
                        child: _colorContainer(
                      e[0],
                      e[1],
                      e[2],
                      height: height_lg,
                    )))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              [scheme.secondary, scheme.onSecondary, "Secondary"],
              [
                scheme.secondaryContainer,
                scheme.onSecondaryContainer,
                "Container"
              ]
            ]
                .map((dynamic e) =>
                    Expanded(child: _colorContainer(e[0], e[1], e[2])))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              [scheme.tertiary, scheme.onTertiary, "Tertiary"],
              [
                scheme.tertiaryContainer,
                scheme.onTertiaryContainer,
                "Container"
              ]
            ]
                .map((dynamic e) =>
                    Expanded(child: _colorContainer(e[0], e[1], e[2])))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              [scheme.error, scheme.onError, "Error"],
              [scheme.errorContainer, scheme.onErrorContainer, "Container"]
            ]
                .map((dynamic e) =>
                    Expanded(child: _colorContainer(e[0], e[1], e[2])))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              [scheme.background, scheme.onBackground, "Background"],
              [scheme.surface, scheme.onSurface, "Surface"]
            ]
                .map((dynamic e) =>
                    Expanded(child: _colorContainer(e[0], e[1], e[2])))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              [scheme.outline, scheme.surfaceVariant, "Outline"],
              [
                scheme.surfaceVariant,
                scheme.onSurfaceVariant,
                "Surface Variant"
              ]
            ]
                .map((dynamic e) =>
                    Expanded(child: _colorContainer(e[0], e[1], e[2])))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ColorSwatchRow extends StatelessWidget {
  const _ColorSwatchRow({super.key, required this.color});
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    Widget swatchItem(int shade, Color itemColor) {
      var hslColor = HSLColor.fromColor(itemColor);
      Color textColor =
          itemColor.lightness > 0.55 ? color.shade900 : color.shade50;
      return Expanded(
        child: Container(
          width: double.infinity,
          height: button_height_lg * 2,
          color: itemColor,
          padding: const EdgeInsets.all(spacing_sm),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  MaviTheme()
                      .textTheme
                      .bodyBold(text: '$shade')
                      .apply(newColor: textColor),
                  MaviTheme()
                      .textTheme
                      .bodySmall(
                          text: itemColor
                              .toString()
                              .replaceAll('Color(0xff', "#")
                              .replaceAll(")", ""))
                      .apply(newColor: textColor),
                  MaviTheme()
                      .textTheme
                      .bodySmall(
                          text:
                              'h: ${hslColor.hue.toInt()} s: ${hslColor.saturation.toStringAsPrecision(2)}, l: ${itemColor.lightness.toStringAsPrecision(2)}')
                      .apply(newColor: textColor)
                ],
              )),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius_container),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          swatchItem(50, color.shade50),
          swatchItem(100, color.shade100),
          swatchItem(200, color.shade200),
          swatchItem(300, color.shade300),
          swatchItem(400, color.shade400),
          swatchItem(500, color.shade500),
          swatchItem(600, color.shade600),
          swatchItem(700, color.shade700),
          swatchItem(800, color.shade800),
          swatchItem(900, color.shade900),
        ],
      ),
    );
  }
}
