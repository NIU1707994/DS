import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'generated/l10n.dart';

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
          title: Text(S.of(context).appTitle),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.apartment),
                    const SizedBox(width: 10),
                    Text(S.of(context).places)
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Icon(Icons.group),
                          Text(S.of(context).groups)],
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Icon(Icons.favorite), Text(S.of(context).favorites)],
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Icon(Icons.favorite),
                          Text(S.of(context).propped)],
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
