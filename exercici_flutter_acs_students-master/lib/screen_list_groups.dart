import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_info_user_group.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'screen_group_options.dart';
import 'generated/l10n.dart';

class ScreenListGroups extends StatefulWidget {
  List<UserGroup> userGroups;

  ScreenListGroups({super.key, required this.userGroups});

  @override
  State<ScreenListGroups> createState() => _ScreenListGroupsState();
}

class _ScreenListGroupsState extends State<ScreenListGroups> {
  late List<UserGroup> userGroups;

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
    userGroups = widget.userGroups; // the userGroups of ScreenListGroups
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // We create a default user and we edit it in screen_info_user_group
            UserGroup newUserGroup = UserGroup(
                Data.defaultName,
                Data.defaultDescription,
                Data.defaultAreas,
                Data.defaultSchedule,
                Data.defaultActions, <User>[]);
            userGroups.add(newUserGroup);
            setState(() {});
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => ScreenInfoUserGroup(
                          userGroup: newUserGroup,
                        )))
                .then((var v) => setState(() {}));
          }),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(S.of(context).userGroups),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: userGroups.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(userGroups[index], index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
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

  Widget _buildRow(UserGroup userGroup, int index) {
    return ListTile(
      title: Text(userGroup.name),
      trailing: Text('${userGroup.users.length}'),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute<void>(
              builder: (context) => ScreenGroupOptions(
                    userGroup: userGroup,
                  )))
          .then((var v) => setState(() {})),
    );
  }
}
