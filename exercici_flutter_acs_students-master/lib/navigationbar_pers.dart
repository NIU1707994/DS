import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class NavigationbarPers extends StatefulWidget {
  int? selectedIndex;
  NavigationbarPers({super.key, this.selectedIndex});

  @override
  State<NavigationbarPers> createState() => _NavigationbarPersState();
}

class _NavigationbarPersState extends State<NavigationbarPers> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.selectedIndex;
  }

  final List<Widget> screenOptions = [
    const ScreenListPlaces(
      id: 'building',
    ),
    ScreenListGroups(userGroups: Data.userGroups),
    const ScreenFavorites(),
  ];

  Widget? get _getScreen {
    if (selectedIndex != Null) {
      return screenOptions[selectedIndex!];
    }
    return null;
  }

  void _changeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: const Icon(Icons.apartment),
              label: S.of(context).places),
          BottomNavigationBarItem(icon: const Icon(Icons.group),
              label: S.of(context).groups),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: S.of(context).favorites),
        ],
        currentIndex: selectedIndex!,
        onTap: _changeSelected,
      ),
    );
  }
}
