import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../components/components_preview.dart';

class ContentColors extends StatelessWidget {
  const ContentColors({super.key});

  @override
  Widget build(BuildContext context) {
    //
    var colorScheme = Theme.of(context).colorScheme;
    Color colorPrimary = colorScheme.primary;
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
                        Container(color: colorPrimary, height: 2, width: 50),
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
                    child: Column(
                      children: [
                        _ColorThemeGrid(scheme: MaviTheme().light),
                        _ColorThemeGrid(scheme: MaviTheme().dark)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
        SectionWidget(title: "$title - Swatches", slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: _ColorSwatchRow(color: MaviTheme().colorSwatch),
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
    double height_lg = 72;
    double height_sm = 24;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height_sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              scheme.primary,
              scheme.onPrimary,
              scheme.primaryContainer,
              scheme.onPrimaryContainer
            ]
                .map((e) => Expanded(
                        child: Container(
                      height: height_lg,
                      color: e,
                      child: Column(
                        children: [Text('$e')],
                      ),
                    )))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              scheme.secondary,
              scheme.onSecondary,
              scheme.secondaryContainer,
              scheme.onSecondaryContainer
            ]
                .map((e) =>
                    Expanded(child: Container(height: height_sm, color: e)))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              scheme.tertiary,
              scheme.onTertiary,
              scheme.tertiaryContainer,
              scheme.onTertiaryContainer
            ]
                .map((e) =>
                    Expanded(child: Container(height: height_sm, color: e)))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              scheme.error,
              scheme.onError,
              scheme.errorContainer,
              scheme.onErrorContainer
            ]
                .map((e) =>
                    Expanded(child: Container(height: height_sm, color: e)))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              scheme.background,
              scheme.onBackground,
              scheme.surface,
              scheme.onSurface
            ]
                .map((e) =>
                    Expanded(child: Container(height: height_sm, color: e)))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              scheme.outline,
              scheme.outline,
              scheme.surfaceVariant,
              scheme.onSurfaceVariant,
            ]
                .map((e) =>
                    Expanded(child: Container(height: height_sm, color: e)))
                .toList(),
          ),
        ]
            .map((e) => Padding(
                  padding: EdgeInsets.only(bottom: spacing_sm),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

class _ColorSwatchRow extends StatelessWidget {
  const _ColorSwatchRow({super.key, required this.color});
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    Widget swatchItem(int shade, Color color) => Expanded(
          child: Container(
            width: double.infinity,
            height: button_height_lg,
            color: color,
            child: Center(child: Text('$shade\n$color')),
          ),
        );
    return Row(
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
    );
  }
}
