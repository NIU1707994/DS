import 'package:exercise_flutter_acs/appbar_pers.dart';
import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:exercise_flutter_acs/screen_favorites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';

class ScreenPropped extends StatefulWidget {
  const ScreenPropped({super.key});

  @override
  State<ScreenPropped> createState() => _ScreenProppedState();
}

class _ScreenProppedState extends State<ScreenPropped> {
  late Future<List<Door>> futureDoors;
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
    futureDoors = getProppedDoors();
  }

  void _refressPage() {
    setState(() {
      futureDoors = getProppedDoors();
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
    return FutureBuilder<List<Door>>(
      future: futureDoors,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Door> items = snapshot.data!;
          return Scaffold(
            appBar: AppbarPers(id: 'Propped', onStateChanged: _refressPage),
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
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.apartment), label: "Places"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Group"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.warning), label: "Propped"),
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
                  builder: (context) => ScreenDoorsSettings(door: item)))
              .then((var v) => setState(() {}));
        });
  }
}
