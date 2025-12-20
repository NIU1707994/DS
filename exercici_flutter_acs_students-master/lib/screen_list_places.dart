import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:exercise_flutter_acs/screen_sapce.dart';
import 'package:flutter/material.dart';

import 'tree.dart';
import 'the_drawer.dart';

class ScreenListPlaces extends StatefulWidget {
//  Area? root;
  // TODO: change string to Areas when implemented
//  UserGroup? userGroup;

//  ScreenListPlaces({super.key, this.root, this.userGroup});
  final String id;
  const ScreenListPlaces({super.key, required this.id});

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

  Widget _buildRow(dynamic item) {
    return ListTile(
        title: Text(item.id),
        onTap: () {
          if (item is Partition) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
                    builder: (context) => ScreenListPlaces(id: item.id)))
                .then((var v) => setState(() {}));
          } else if (item is Area) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
                    builder: (context) => ScreenSpace(id: item.id)))
                .then((var v) => setState(() {}));
          }
        });
  }
}
