import 'package:exercise_flutter_acs/navigationbar_pers.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class ScreenBlank extends StatefulWidget {
  const ScreenBlank({super.key});

  @override
  State<ScreenBlank> createState() => _ScreenBlankState();
}

class _ScreenBlankState extends State<ScreenBlank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("ACS"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Card(
                  child: Container(
                width: 250,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.apartment),
                    SizedBox(width: 10),
                    Text("Places")
                  ],
                ),
              )),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) =>
                        const ScreenListPlaces(id: 'building')));
              },
            ),
            InkWell(
              child: Card(
                  child: Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.group), Text("Groups")],
                      ))),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) =>
                        ScreenListGroups(userGroups: Data.userGroups)));
              },
            ),
            InkWell(
              child: Card(
                  child: Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.favorite), Text("Favoutites")],
                      ))),
              onTap: () {
                Navigator.of(context).pop(); // close drawer
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const ScreenFavorites(),
                ));
              },
            ),
            InkWell(
              child: Card(
                  child: Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.favorite), Text("Favoutites")],
                      ))),
              onTap: () {
                Navigator.of(context).pop(); // close drawer
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const ScreenPropped(),
                ));
              },
            )
          ],
        )));
  }
}
