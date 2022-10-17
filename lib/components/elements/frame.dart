import 'package:flutter/material.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

class MFrame extends StatelessWidget {
  const MFrame(
      {super.key,
      required this.child,
      this.size = MSize.md,
      this.border = true});

  final Widget child;
  final MSize size;
  final bool border;
  @override
  Widget build(BuildContext context) {
    var neutralSwatch = Theme.of(context).colorScheme.neutralSwatch;
    return Container(
      padding: EdgeInsets.all(size.spacing),
      decoration: BoxDecoration(
        color: neutralSwatch.shade50,
        borderRadius: BorderRadius.circular(size.radius),
        border: !border ? null : Border.all(color: neutralSwatch.shade100),
      ),
      child: child,
    );
  }
}
