import 'dart:io';

import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:exercise_flutter_acs/screen_user_detail.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'generated/l10n.dart';

class ScreeListUsers extends StatefulWidget {
  UserGroup userGroup;

  ScreeListUsers({super.key, required this.userGroup});

  @override
  State<ScreeListUsers> createState() => _ScreenListUsersState();
}

class _ScreenListUsersState extends State<ScreeListUsers> {
  late UserGroup userGroup;
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
          onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) =>
                            ScreenUserDetail(userGroup: userGroup)))
                    .then((newUser) => setState(() {}))
              }),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(S.of(context).usersTitle(userGroup.name)),
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: userGroup.users.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(userGroup.users[index], index),
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

  Widget _buildRow(User user, int index) {
    return ListTile(
        leading: CircleAvatar(
            foregroundImage: user.imageName.startsWith('http')
                ? NetworkImage(user.imageName)
                : FileImage(File(user.imageName)) as ImageProvider),
        title: Text(user.name),
        trailing: Text(user.credential),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) =>
                    ScreenUserDetail(userGroup: userGroup, user: user)))
            .then((newUser) => setState(() {
                  user = newUser;
                })));
  }
}
