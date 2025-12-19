import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:flutter/material.dart';

import 'tree.dart';
import 'the_drawer.dart';

class ScreenSapce extends StatefulWidget {
//  Area? root;
  // TODO: change string to Areas when implemented
//  UserGroup? userGroup;

//  ScreenListPlaces({super.key, this.root, this.userGroup});
  final String id;
  const ScreenSapce({super.key, required this.id});

  @override
  State<ScreenSapce> createState() => _ScreenSpace();
}

class _ScreenSpace extends State<ScreenSapce> {
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
          return Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")));
        }
        // MENTRE ESPEREM: Mostrem la rodeta de càrrega
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildRow(Door item) {
    return ListTile(
        leading: item.closed
            ? const Icon(Icons.sensor_door_sharp)
            : const Icon(Icons.meeting_room),
        title: Text(item.id),
        subtitle: Text(item.state),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
                  builder: (context) => ScreenDoorsSettings(door: item)))
              .then((var v) => setState(() {}));
        });
  }
}
