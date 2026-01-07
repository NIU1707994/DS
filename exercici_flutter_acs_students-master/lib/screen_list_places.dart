import 'package:exercise_flutter_acs/appbar_pers.dart';
import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/favourites_storage.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:exercise_flutter_acs/screen_space.dart';
import 'package:flutter/material.dart';
import 'tree.dart';
import 'generated/l10n.dart';

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
    const ScreenFavorites(),
    const ScreenPropped()
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

          // Mirem si les arees que arriben son preferides o no
          if (FavoritesStorage.isFavorite(root.id)) {
            root.favourite = true;
          }

          for (var child in root.children) {
            if (child is Area && FavoritesStorage.isFavorite(child.id)) {
              child.favourite = true;
            }
          }

          List<dynamic> items = root.children;


          return Scaffold(
            appBar: AppbarPers(id: root.id, onStateChanged: _refressPage),
            body: ListView.separated(
              itemCount: items.length, //ScrenFavorites()
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => _buildRow(items[index]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.onPrimary,
              unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: const Icon(Icons.apartment),
                    label: S.of(context).places),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.group),
                    label: S.of(context).groups),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    label: S.of(context).favorites),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.warning),
                    label: S.of(context).propped),
              ],
              currentIndex: selectedIndex,
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
        leading: item.icon,
        title: Text(
          item.id,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
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
