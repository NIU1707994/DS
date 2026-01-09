import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';

import 'favourites_storage.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_space.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class ScreenFavorites extends StatefulWidget {
  const ScreenFavorites({super.key});

  @override
  State<ScreenFavorites> createState() => _ScreenFavoritesState();
}

class _ScreenFavoritesState extends State<ScreenFavorites> {
  late List<Area> visibleFavorites;
  int selectedIndex = 2;
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
    visibleFavorites = List.from(FavoritesStorage.favorites);
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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(S.of(context).favorites),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              PopupMenuButton<Locale>(
                icon: const Icon(Icons.language),
                onSelected: (Locale newLocale) {
                  S.load(newLocale);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
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
        body: visibleFavorites.isEmpty
            ? Center(child: Text(S.of(context).noFavorites))
            : ListView.separated(
                itemCount: visibleFavorites.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  Area area = visibleFavorites[index];

                  bool isGlobalFav = FavoritesStorage.isFavorite(area.id);

                  return ListTile(
                    leading: area.icon,
                    title: Text(
                      area.id,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isGlobalFav ? Icons.favorite : Icons.favorite_border,
                        color: isGlobalFav ? Colors.red : null,
                      ),
                      onPressed: () {
                        setState(() {
                          FavoritesStorage.toggleFavorite(area);
                        });
                      },
                    ),
                    onTap: () {
                      if (area is Partition) {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) =>
                                ScreenListPlaces(id: area.id)));
                      } else if (area is Space) {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => ScreenSpace(id: area.id)));
                      }
                    },
                  );
                },
              ),
        bottomNavigationBar: _buidNavigationBar());
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
}
