import 'package:exercise_flutter_acs/appbar_pers.dart';
import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'tree.dart';

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
  int selectedIndex = 0;
  final List<Widget> screenOptions = [
    const ScreenListPlaces(
      id: 'building',
    ),
    ScreenListGroups(userGroups: Data.userGroups),
    const ScreenFavorites(),
    const ScreenPropped()
  ];
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
          root = snapshot.data!.root;
          List<dynamic> items = root!.children;

          return Scaffold(
              appBar: AppbarPers(
                id: root!.id,
                onStateChanged: _refressPage,
              ),
              body: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => _buildRow(items[index]),
              ),
              bottomNavigationBar: _buidNavigationBar());
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")));
        }
        // MENTRE ESPEREM: Mostrem la rodeta de càrrega
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buidNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.apartment), label: S.of(context).places),
        BottomNavigationBarItem(
            icon: const Icon(Icons.group), label: S.of(context).groups),
        BottomNavigationBarItem(
            icon: const Icon(Icons.favorite), label: S.of(context).favorites),
        BottomNavigationBarItem(
            icon: const Icon(Icons.warning), label: S.of(context).propped),
      ],
      currentIndex: selectedIndex,
      onTap: _changeSelected,
    );
  }

  Widget _buildRow(Door item) {
    late Icon icon;

    if (item.state != 'propped') {
      icon = item.closed
          ? const Icon(
              Icons.sensor_door_sharp,
              size: 35,
              color: Colors.black,
            )
          : const Icon(
              Icons.meeting_room,
              size: 35,
              color: Colors.black,
            );
    } else {
      icon = const Icon(
        Icons.warning,
        size: 35,
        color: Colors.red,
      );
    }

    return ListTile(
        leading: icon,
        title: Text(
          item.id,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text(
          item.state,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
                  builder: (context) => ScreenDoorsSettings(
                        door: item,
                        selectedIndex: 0,
                      )))
              .then((var v) => setState(() {}));
        });
  }
}
