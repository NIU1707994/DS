import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class ScreenPropped extends StatefulWidget {
  const ScreenPropped({super.key});

  @override
  State<ScreenPropped> createState() => _ScreenProppedState();
}

class _ScreenProppedState extends State<ScreenPropped> {
  late Future<List<Door>> futureDoors;
  int selectedIndex = 3;

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

  void _refressPage() async {
    var currentDoors = await getProppedDoors();
    setState(() {
      futureDoors = Future.value(currentDoors);
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
              appBar: AppBar(
                  leadingWidth: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  title: Text(S.of(context).propped),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  actions: [
                    PopupMenuButton<Locale>(
                      icon: const Icon(Icons.language),
                      onSelected: (Locale newLocale) {
                        S.load(newLocale);
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Locale>>[
                        const PopupMenuItem<Locale>(
                          value: Locale('en'),
                          child: Text('English'),
                        ),
                        const PopupMenuItem<Locale>(
                          value: Locale('ca'),
                          child: Text('Català'),
                        ),
                        const PopupMenuItem<Locale>(
                          value: Locale('es'),
                          child: Text('Español'),
                        ),
                      ],
                    ),
                  ]),
              body: (items.isNotEmpty)
                  ? ListView.separated(
                      itemCount: items.length, //ScrenFavorites()
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => _buildRow(items[index]),
                    )
                  : Center(
                      child: Text(
                        S.of(context).noProppedDoors,
                        style: const TextStyle(fontSize: 25),
                      ),
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
                        selectedIndex: 3,
                      )))
              .then((_) => _refressPage());
        });
  }
}
