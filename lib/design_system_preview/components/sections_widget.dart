import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:sliver_tools/sliver_tools.dart';

import '../../theme/theme.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.title, required this.slivers});
  final String title;
  final List<Widget> slivers;
  @override
  Widget build(BuildContext context) {
    //
    var colorScheme = Theme.of(context).colorScheme;
    Color colorPrimary = colorScheme.primary;
    //
    return MultiSliver(pushPinnedChildren: true, children: [
      SliverPinnedHeader(
          child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              color: colorScheme.background.withOpacity(0.6),
              padding: EdgeInsets.all(spacing_sm),
              child: MaviTextTheme()
                  .overline(text: title)
                  .copyWith(newColor: colorScheme.outline)),
        ),
      )),
      SliverToBoxAdapter(child: maviThemeSpacer()),
      ...slivers,
      SliverToBoxAdapter(child: maviThemeSpacer(size: spacing_lg)),
    ]);
  }
}
