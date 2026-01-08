import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_action_list.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:exercise_flutter_acs/screen_schedule.dart';
import 'package:exercise_flutter_acs/screen_info_user_group.dart';
import 'package:flutter/material.dart';
import 'screen_list_users.dart';
import 'generated/l10n.dart';

class ScreenGroupOptions extends StatefulWidget {
  UserGroup userGroup;
  ScreenGroupOptions({super.key, required this.userGroup});

  @override
  State<ScreenGroupOptions> createState() => _ScreenGroupOptionsState();
}

class _ScreenGroupOptionsState extends State<ScreenGroupOptions> {
  late UserGroup userGroup;
  late String _appBarName;
  int selectedIndex = 1;

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
    userGroup = widget.userGroup; // the userGroup of ScreenListGroups
    _appBarName = userGroup.name;
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
        title: Text(S.of(context).usersTitle(_appBarName)),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            InkWell(
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute<void>(
                        builder: (context) =>
                            ScreenInfoUserGroup(userGroup: userGroup)))
                    .then((newUserGroup) => setState(() {
                          userGroup = newUserGroup as UserGroup;
                          _appBarName = userGroup.name;
                        }))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.article_outlined,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).info,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreeSchedule(userGroup: userGroup)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).schedule,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) =>
                        ScreenActionList(userGroup: userGroup)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.room_preferences_outlined,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).actions,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreenListPlaces(id: userGroup.name)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.holiday_village,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).places,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreeListUsers(userGroup: userGroup)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.manage_accounts,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).users,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buidNavigationBar(),
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
}
