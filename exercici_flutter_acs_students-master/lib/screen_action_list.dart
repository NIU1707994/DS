import 'package:exercise_flutter_acs/data.dart';
import 'package:flutter/material.dart' hide Actions;

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

  Widget _buildRow(int index) {
    return ListTile(
        title: Text(actions[index]),
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
              child: const Text("Sumbit"),
            ),
          ],
        ),
      ),
    );
  }
}
