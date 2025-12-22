import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:flutter/material.dart';

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
    //ScrenFavorites()
  ];

  Widget? get _getScreen {
    if (selectedIndex != Null) {
      return screenOptions[selectedIndex!];
    }
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.apartment), label: "Places"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Group"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
        currentIndex: selectedIndex!,
        onTap: _changeSelected,
      ),
    );
  }
}
