import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:flutter/material.dart';

import 'tree.dart';
import 'the_drawer.dart';

class ScreenListPlaces extends StatefulWidget {
  Area? root;
  // TODO: change string to Areas when implemented
  UserGroup? userGroup;

  ScreenListPlaces({super.key, this.root, this.userGroup});

  @override
  State<ScreenListPlaces> createState() => _ScreenListPlaces();
}

class _ScreenListPlaces extends State<ScreenListPlaces> {
  Area? root;
  UserGroup? userGroup;
  late List<dynamic> areas;

  @override
  void initState() {
    super.initState();
    if (widget.root != null) {
      root = widget.root;
      areas = root!.children;
    } else if (widget.userGroup != null) {
      userGroup = widget.userGroup;
      areas = userGroup!.areas;
    } else {
      areas = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TheDrawer(context).drawer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text((root != null) ? root!.id : "User Group ${userGroup!.name} areas"),
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
      trailing: Text(area is Area ? '${area.children.length}' : area.state),
      onTap: () {
        if (area is Area) {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
              builder: (context) =>
                  ScreenListPlaces(
                    root: area,
                  )))
              .then((var v) => setState(() {}));
        } else if (area is Door) {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
              builder: (context) =>
                  ScreenDoorsSettings(
                    door: area
                  )))
              .then((var v) => setState(() {}));
        }
      })
    ;
  }
}
