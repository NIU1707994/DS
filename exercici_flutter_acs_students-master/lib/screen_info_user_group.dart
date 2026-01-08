import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class ScreenInfoUserGroup extends StatefulWidget {
  UserGroup userGroup;
  ScreenInfoUserGroup({super.key, required this.userGroup});

  @override
  State<ScreenInfoUserGroup> createState() => _ScreenInfoUserGroupState();
}

class _ScreenInfoUserGroupState extends State<ScreenInfoUserGroup> {
  late UserGroup userGroup;
  // This key makes possible the unique identification of the form
  // Also, the change of variables by the content of the text fields.
  final _formKey = GlobalKey<FormState>();
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
        title: Text(S.of(context).infoTitle(userGroup.name)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, userGroup);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: S.of(context).nameGroup),
                  initialValue: userGroup.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).enterText;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userGroup.name = value ?? ''; // '' Will never happen,
                    // because we are validating.
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: S.of(context).description),
                  maxLines: 5,
                  initialValue: userGroup.description,
                  onSaved: (value) {
                    userGroup.description =
                        value ?? ''; // '' Will never happen,
                    // because we are validating.
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    submitFunction();
                  },
                  child: Text(S.of(context).submit),
                ),
              ],
            ),
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

  void submitFunction() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).saved)),
        );
      }
    });
  }
}
