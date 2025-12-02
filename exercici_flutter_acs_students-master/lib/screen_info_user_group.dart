import 'package:exercise_flutter_acs/data.dart';
import 'package:flutter/material.dart';

class ScreenInfoUserGroup extends StatefulWidget {
  UserGroup? userGroup;
  ScreenInfoUserGroup({super.key, this.userGroup});

  @override
  State<ScreenInfoUserGroup> createState() => _ScreenInfoUserGroupState();
}

class _ScreenInfoUserGroupState extends State<ScreenInfoUserGroup> {
  late UserGroup userGroup;
  late TextEditingController _controllerName;
  late TextEditingController _controllerDescription;
  late String _appBarTitle;

  @override
  void initState() {
    super.initState();

    userGroup = widget.userGroup ?? UserGroup.empty();
    _controllerName = TextEditingController();
    _controllerDescription = TextEditingController();

    _controllerName.text = userGroup.name;
    _controllerDescription.text = userGroup.description;
    _appBarTitle =
        "Info ${userGroup.name.isNotEmpty ? userGroup.name : 'new user group'}";
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(_appBarTitle),
        leading: IconButton(
            onPressed: () => {Navigator.of(context).pop(userGroup)},
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _controllerName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name Group'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controllerDescription,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Description'),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  saveNames();
                },
                child: const Text("Sumbit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveNames() {
    setState(() {
      List<UserGroup> userGroups = Data.userGroups;
      if (userGroups.contains(userGroup)) {
        var index = userGroups.indexOf(userGroup);

        userGroup.name = _controllerName.text;
        userGroup.description = _controllerDescription.text;

        userGroups[index] = userGroup;
      } else {
        userGroup.name = _controllerName.text;
        userGroup.description = _controllerDescription.text;
        userGroups.add(userGroup);
      }

      _appBarTitle =
          "Info ${_controllerName.text.isNotEmpty ? _controllerName.text : 'new user group'}";

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Saved!")));
    });
  }
}
