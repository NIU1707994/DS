import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:flutter/material.dart';

import 'tree.dart';
import 'the_drawer.dart';

class ScreenSpace extends StatefulWidget {
  final String id;
  const ScreenSpace({super.key, required this.id});

  @override
  State<ScreenSpace> createState() => _ScreenSpace();
}

class _ScreenSpace extends State<ScreenSpace> {
  //Area? root;
  //UserGroup? userGroup;
  //late List<dynamic> areas;
  late Future<Tree> futureTree;
  late IconData favouriteIcon = Icons.favorite_border;
  late IconData lockedAreaIcon = Icons.lock_outline;
  Area? root;
  late String state;

  @override
  void initState() {
    super.initState();
    // Demanem les dades al servidor només començar
    futureTree = getTree(widget.id);
    state = 'lock';
  }

  void _addFavourites() {
    root!.favourite = !root!.favourite;

    setState(() {
      favouriteIcon = root!.favourite ? Icons.favorite : Icons.favorite_border;
    });

  }

  void _lockUnlockArea() {
    setState(() {
      if (state == 'lock') {
        lockedAreaIcon = Icons.lock_open;
        state = 'unlock';
        unlockArea(root!);
      } else {
        lockedAreaIcon = Icons.lock_outline;
        state = 'lock';
        lockArea(root!);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: futureTree,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // QUAN LES DADES ARRIBEN:
          root = snapshot.data!.root;
          List<dynamic> items = root!.children;

          return Scaffold(
            appBar: AppBar(title: Text(root!.id),
            actions: [
              IconButton(onPressed: _addFavourites, icon: Icon(favouriteIcon)),
              IconButton(onPressed: _lockUnlockArea, icon: Icon(lockedAreaIcon)),
            ],),
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
    late IconData icon;

    if (item.state != 'propped') {
      icon = item.closed ? (Icons.sensor_door_sharp) : Icons.meeting_room;
    } else {
      icon = Icons.warning;
    }

    return ListTile(
        leading: Icon(icon, size: 35,),
        title: Text(item.id,
                    style: const TextStyle(
                      fontSize: 20,),),
        subtitle: Text(
                        item.state,
                        style: const TextStyle(
                        fontSize: 15
        ),),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
                  builder: (context) => ScreenDoorsSettings(door: item)))
              .then((var v) => setState(() {}));
        });
  }
}
