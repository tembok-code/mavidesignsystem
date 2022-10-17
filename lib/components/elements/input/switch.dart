import 'package:flutter/material.dart';

class MSwitch extends StatefulWidget {
  const MSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final Function(bool value) onChanged;

  @override
  State<MSwitch> createState() => _MSwitchState();
}

class _MSwitchState extends State<MSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(value: widget.value, onChanged: widget.onChanged);
  }
}
