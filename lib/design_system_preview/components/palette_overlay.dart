import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/components.dart';

import '../../components/elements/contents/text.dart';

class PaletteOverlay extends StatefulWidget {
  const PaletteOverlay({super.key, this.isExpanded = false});

  final bool isExpanded;

  @override
  State<PaletteOverlay> createState() => _PaletteOverlayState();
}

class _PaletteOverlayState extends State<PaletteOverlay> {
  //
  void showOverlay(BuildContext context, Offset position) {
    var overlayState = Overlay.of(context);
    var overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.3),
            )),
            Positioned(
                left: position.dx,
                top: position.dy,
                child: const _OverlayPanel()),
          ],
        );
      },
    ); //
    overlayState!.insert(overlayEntry);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isExpanded = widget.isExpanded;
    //
    var colorScheme = Theme.of(context).colorScheme;
    //
    return MouseRegion(
      child: GestureDetector(
        onTapDown: (details) => showOverlay(context, details.globalPosition),
        child: Material(
          color: colorScheme.primaryContainer,
          child: Icon(
            Icons.color_lens_outlined,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

class _OverlayPanel extends StatelessWidget {
  const _OverlayPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      //color: Colors.white,
      child: MText('Content'),
    );
  }
}
