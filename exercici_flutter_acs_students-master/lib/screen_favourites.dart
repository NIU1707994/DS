import 'favourites_storage.dart';
import 'package:exercise_flutter_acs/screen_doors_settings.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_space.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';

class ScreenFavorites extends StatefulWidget {
  const ScreenFavorites({super.key});

  @override
  State<ScreenFavorites> createState() => _ScreenFavoritesState();
}

class _ScreenFavoritesState extends State<ScreenFavorites> {
  late List<Area> visibleFavorites;

  @override
  void initState() {
    super.initState();
    visibleFavorites = List.from(FavoritesStorage.favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Preferits"),
        centerTitle: true,
      ),
      body: visibleFavorites.isEmpty
          ? const Center(child: Text("No hi ha preferits"))
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
                    builder: (context) => ScreenListPlaces(id: area.id)));
              } else if (area is Space) {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreenSpace(id: area.id)));
              }
            },
          );
        },
      ),
    );
  }
}