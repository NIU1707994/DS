import 'dart:io';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:file_picker/file_picker.dart';
import 'package:exercise_flutter_acs/data.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'generated/l10n.dart';

class ScreenUserDetail extends StatefulWidget {
  UserGroup? userGroup;
  User? user;
  ScreenUserDetail({super.key, required this.userGroup, this.user});

  @override
  State<ScreenUserDetail> createState() => _ScreenUserDetailState();
}

class _ScreenUserDetailState extends State<ScreenUserDetail> {
  late UserGroup userGroup;
  late User user;
  late TextEditingController _controllerName;
  late TextEditingController _controllerCredential;
  late FileImage imageAvatar;
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

    userGroup = widget.userGroup!;
    user = widget.user ?? User.empty();
    _controllerName = TextEditingController();
    _controllerCredential = TextEditingController();

    _controllerName.text = user.name;
    _controllerCredential.text = user.credential;
    imageAvatar = FileImage(File(user.imageName));
  }

  void _changeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => screenOptions[selectedIndex]));
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerCredential.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("User"),
        leading: IconButton(
            onPressed: () => {Navigator.of(context).pop(user)},
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            initialDirectory:
                                p.join(Directory.current.path, './faces'));

                    if (result != null) {
                      user.imageName = result.files.single.path!;
                      setState(() {
                        imageAvatar = FileImage(File(user.imageName));
                      });
                    }
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 100,
                      foregroundImage: imageAvatar)),
              const SizedBox(height: 16),
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: S.of(context).name),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controllerCredential,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: S.of(context).credential),
                maxLines: null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  saveNames();
                },
                child: Text(S.of(context).submit),
              ),
            ],
          ),
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

  void saveNames() {
    setState(() {
      var indexUserGroup = Data.userGroups.indexOf(userGroup);

      if (userGroup.users.contains(user)) {
        var indexUser = userGroup.users.indexOf(user);

        user.name = _controllerName.text;
        user.credential = _controllerCredential.text;

        userGroup.users[indexUser] = user;
      } else {
        user.name = _controllerName.text;
        user.credential = _controllerCredential.text;
        userGroup.users.add(user);
      }

      Data.userGroups[indexUserGroup] = userGroup;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).saved)));
    });
  }
}
