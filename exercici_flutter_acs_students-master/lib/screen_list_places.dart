import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:flutter/material.dart';

import 'tree.dart';
import 'the_drawer.dart';

class ScreenListPlaces extends StatefulWidget {
//  Area? root;
  // TODO: change string to Areas when implemented
//  UserGroup? userGroup;

//  ScreenListPlaces({super.key, this.root, this.userGroup});
  final String id;
  ScreenListPlaces({super.key, required this.id});

  @override
  State<ScreenListPlaces> createState() => _ScreenListPlaces();
}

class _ScreenListPlaces extends State<ScreenListPlaces> {
  //Area? root;
  //UserGroup? userGroup;
  //late List<dynamic> areas;
  late Future<Tree> futureTree;

  @override
  void initState() {
    super.initState();
    // Demanem les dades al servidor només començar
    futureTree = getTree(widget.id);
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return FutureBuilder<Tree>(
      future: futureTree,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // QUAN LES DADES ARRIBEN:
          Area root = snapshot.data!.root;
          List<dynamic> items = root.children;

          return Scaffold(
            appBar: AppBar(title: Text(root.id)),
            body: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => _buildRow(items[index]),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text("Error: ${snapshot.error}")));
        }
        // MENTRE ESPEREM: Mostrem la rodeta de càrrega
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
=======
    return Scaffold(
      drawer: TheDrawer(context).drawer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
            (root != null) ? root!.id : "User Group ${userGroup!.name} areas"),
        leading: root!.id == "building"
            ? null
            : IconButton(
                onPressed: () => {Navigator.of(context).pop()},
                icon: const Icon(Icons.arrow_back)),
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
>>>>>>> 1b2f0b2 (Cosetes (no se quines))
    );
  }

  Widget _buildRow(dynamic item) {
    return ListTile(
<<<<<<< HEAD
      title: Text(item.id),
      onTap: () {
        if (item is Area) {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
              builder: (context) =>
                  ScreenListPlaces(
                    id: item.id
                  )))
              .then((var v) => setState(() {}));
        } else if (item is Door) {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
              builder: (context) =>
                  ScreenDoorsSettings(
                    door: item
                  )))
              .then((var v) => setState(() {}));
        }
      })
    ;
=======
        title: Text(area.id),
        trailing: Text(area is Area ? '${area.children.length}' : area.state),
        onTap: () {
          if (area is Area) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
                    builder: (context) => ScreenListPlaces(
                          root: area,
                        )))
                .then((var v) => setState(() {}));
          } else if (area is Door) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
                    builder: (context) => ScreenDoorsSettings(door: area)))
                .then((var v) => setState(() {}));
          }
        });
>>>>>>> 1b2f0b2 (Cosetes (no se quines))
  }
}
