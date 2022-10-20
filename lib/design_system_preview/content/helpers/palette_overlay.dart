import 'package:flutter/material.dart';
import 'package:mavi_design_system/design_system_preview/components/components_preview.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

class ContentPaletteOverlay extends StatefulWidget {
  const ContentPaletteOverlay({super.key});

  @override
  State<ContentPaletteOverlay> createState() => _ContentPaletteOverlayState();
}

class _ContentPaletteOverlayState extends State<ContentPaletteOverlay> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(margin_lg),
            child: MFrame(child: PaletteOverlay()),
          ),
        )
      ],
    );
  }
}
