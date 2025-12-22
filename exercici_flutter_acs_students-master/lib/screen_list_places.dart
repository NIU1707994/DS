import 'package:exercise_flutter_acs/appbar_pers.dart';
import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/navigationbar_pers.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_sapce.dart';
import 'package:flutter/material.dart';
import 'tree.dart';

class ScreenListPlaces extends StatefulWidget {
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
  int selectedIndex = 0;

  final List<Widget> screenOptions = [
    const ScreenListPlaces(
      id: 'building',
    ),
    ScreenListGroups(userGroups: Data.userGroups),
    //ScrenFavorites()
  ];

  @override
  void initState() {
    super.initState();
    // Demanem les dades al servidor només començar
    futureTree = getTree(widget.id);
  }

  void _refressPage() {
    setState(() {
      futureTree = getTree(widget.id);
    });
  }

  void _changeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => screenOptions[selectedIndex]));
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
            appBar: AppbarPers(id: root.id, onStateChanged: _refressPage),
            body: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => _buildRow(items[index]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.onPrimary,
              unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.apartment), label: "Places"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Group"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
              ],
              currentIndex: selectedIndex!,
              onTap: _changeSelected,
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
          } else if (item is Space) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
                    builder: (context) => ScreenSpace(id: item.id)))
                .then((var v) => setState(() {}));
          }
        });
  }
}
