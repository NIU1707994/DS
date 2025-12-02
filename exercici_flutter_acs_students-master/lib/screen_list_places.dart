import 'package:flutter/material.dart';

import 'tree.dart';
import 'the_drawer.dart';
import 'screen_list_users.dart';

class ScreenListPlaces extends StatefulWidget {
  Area root;

  ScreenListPlaces({super.key, required this.root});

  @override
  State<ScreenListPlaces> createState() => _ScreenListPlaces();
}

class _ScreenListPlaces extends State<ScreenListPlaces> {
  late Area root;
  late List<dynamic> areas;

  @override
  void initState() {
    super.initState();
    root = widget.root;
    areas = root.children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(context).drawer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(root.id),
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: areas.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(areas[index], index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _buildRow(dynamic area, int index) {
    return ListTile(
      title: Text(area.id),
      trailing: Text('${area.children.length}'),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute<void>(
              builder: (context) => ScreenListPlaces(
                    root: area,
                  )))
          .then((var v) => setState(() {})),
    );
  }
}
