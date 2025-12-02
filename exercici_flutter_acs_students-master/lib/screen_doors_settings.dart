import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';

class ScreenDoorsSettings extends StatefulWidget {
  Door door;
  ScreenDoorsSettings({super.key, required this.door});

  @override
  State<ScreenDoorsSettings> createState() => _ScreenDoorsSettingsState();
}

class _ScreenDoorsSettingsState extends State<ScreenDoorsSettings> {
  late Door door;

  @override
  void initState() {
    super.initState();
    door = widget.door;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Door ${door.id}"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

