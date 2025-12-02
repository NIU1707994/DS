import 'package:flutter/material.dart';

import 'data.dart';
import 'the_drawer.dart';

class ScreeListUsers extends StatefulWidget {
  UserGroup userGroup;

  ScreeListUsers({super.key, required this.userGroup});

  @override
  State<ScreeListUsers> createState() => _ScreenListUsersState();
}

class _ScreenListUsersState extends State<ScreeListUsers> {
  late UserGroup userGroup;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup; // the userGroup of ScreenListGroups
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: assign names like New group 1, New group 2...
          UserGroup newUserGroup = UserGroup(
              Data.defaultName,
              Data.defaultDescription,
              Data.defaultAreas,
              Data.defaultSchedule,
              Data.defaultActions, <User>[]);
          setState(() {});
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Users ${userGroup.name}"),
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
    );
  }

  Widget _buildRow(User user, int index) {
    return ListTile(
        title: Text(userGroup.name),
        trailing: Text('${userGroup.users.length}'),
        onTap: () => Navigator.of(context) //.push(route).then(onValue),
        );
  }
}
