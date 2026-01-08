import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:flutter/material.dart' hide Actions;
import 'generated/l10n.dart';

class ScreenActionList extends StatefulWidget {
  UserGroup userGroup;

  ScreenActionList({super.key, required this.userGroup});

  @override
  State<ScreenActionList> createState() => _ScreenActionListState();
}

class _ScreenActionListState extends State<ScreenActionList> {
  late UserGroup userGroup;
  late List<String> actions;
  late List<bool> checkedList;
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

    userGroup = widget.userGroup;
    actions = Actions.all;
    checkedList = List.filled(actions.length, false);

    for (String action in actions) {
      if (userGroup.actions.contains(action)) {
        int index = actions.indexOf(action);
        checkedList[index] = true;
      }
    }
  }

  void _changeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => screenOptions[selectedIndex]));
  }

  String _getLocalizedAction(String actionCode) {
    switch (actionCode) {
      case 'open':
        return S.of(context).actionOpen;
      case 'close':
        return S.of(context).actionClose;
      case 'lock':
        return S.of(context).actionLock;
      case 'unlock':
        return S.of(context).actionUnlock;
      case 'unlock_shortly':
        return S.of(context).actionUnlockShortly;
      default:
        return actionCode; // Per si de cas
    }
  }

  Widget _buildRow(int index) {
    return ListTile(
        title: Text(_getLocalizedAction(actions[index])),
        trailing: Checkbox(
            value: checkedList[index],
            onChanged: (bool? value) => {
                  setState(() {
                    checkedList[index] = value!;
                  })
                }));
  }

  void _saveActions() {
    List<String> newActions = List.empty(growable: true);

    for (int i = 0; i < checkedList.length; i++) {
      if (checkedList[i]) {
        newActions.add(actions[i]);
      }
    }

    List<UserGroup> listUserGroups = Data.userGroups;
    if (listUserGroups.contains(userGroup)) {
      int index = listUserGroups.indexOf(userGroup);
      listUserGroups[index].actions = newActions;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(S.of(context).actionsSaved)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Actions"),
        leading: IconButton(
            onPressed: () => {Navigator.of(context).pop()},
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    _buildRow(index),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: actions.length),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                _saveActions();
              },
              child: Text(S.of(context).submit),
            ),
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
