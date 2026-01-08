import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/screen_favourites.dart';
import 'package:exercise_flutter_acs/screen_list_groups.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_propped.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class ScreenDoorsSettings extends StatefulWidget {
  Door door;
  int selectedIndex;
  ScreenDoorsSettings(
      {super.key, required this.door, required this.selectedIndex});

  @override
  State<ScreenDoorsSettings> createState() => _ScreenDoorsSettingsState();
}

class _ScreenDoorsSettingsState extends State<ScreenDoorsSettings> {
  late Future<Door> _futureDoor;
  late Door door;
  late String state;
  late String action;
  late List<bool> enableSatates;
  late List<bool> enableActions;
  int selectedIndex = 0;
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
    door = widget.door;
    state = door.state;
    action = door.closed ? 'close' : 'open';
    selectedIndex = widget.selectedIndex;

    _futureDoor = Future.value(door);

    enableSatates = List<bool>.filled(3, false);
    enableActions = List<bool>.filled(2, false);

    updateEnabledOption();
  }

  void updateEnabledOption() {
    switch (door.state) {
      case 'locked':
        enableSatates[0] = true;
        enableSatates[1] = true;
        enableSatates[2] = true;

        enableActions[0] = false;
        enableActions[1] = false;
        break;
      case 'unlocked':
        enableSatates[0] = door.closed;
        enableSatates[1] = true;
        enableSatates[2] = false;

        enableActions[0] = true;
        enableActions[1] = true;
        break;
      case 'unlocked_shortly':
        enableSatates[0] = door.closed;
        enableSatates[1] = false;
        enableSatates[2] = true;

        enableActions[0] = true;
        enableActions[1] = true;
        break;
      case 'propped':
        enableSatates[0] = door.closed;
        enableSatates[1] = false;
        enableSatates[2] = true;

        enableActions[0] = true;
        enableActions[1] = true;
        break;
      default:
    }
  }

  Future<void> _changeState(String newState) async {
    setState(() {
      door.state = newState;
    });

    if (door.state == 'locked') {
      await lockDoor(door);

      _futureDoor = Future.value(door);

      _showSnackBarMessage(S.of(context).doorLocked);
    } else if (door.state == 'unlocked') {
      await unlockDoor(door);

      _futureDoor = Future.value(door);

      _showSnackBarMessage(S.of(context).doorUnlocked);
    } else {
      await unlockShortlyDoor(door);

      _futureDoor = Future.value(door);

      _showSnackBarMessage((S.of(context).doorUnlockedShortly));
    }

    setState(() {
      updateEnabledOption();
    });
  }

  void _changeAction(String newAction) async {
    setState(() {
      action = newAction;

      if (action == 'close') {
        door.closed = true;

        _showSnackBarMessage((S.of(context).doorClosed));
      } else {
        door.closed = false;

        _showSnackBarMessage((S.of(context).doorUnlocked));
      }
    });

    await openCloseDoor(door);

    _futureDoor = Future.value(door);

    setState(() {
      updateEnabledOption();
    });
  }

  void _showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
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
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).doorTitle(door.id)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: FutureBuilder<Door>(
            future: _futureDoor,
            builder: (context, snapshot) {
              return Stack(children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SegmentedButton(
                        segments: <ButtonSegment<String>>[
                          ButtonSegment(
                              value: 'locked',
                              tooltip: S.of(context).actionLock,
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock_outline,
                                  size: 50,
                                ),
                              ),
                              enabled: enableSatates[0]),
                          ButtonSegment(
                              value: 'unlocked',
                              tooltip: S.of(context).actionUnlock,
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock_open,
                                  size: 50,
                                ),
                              ),
                              enabled: enableSatates[1]),
                          ButtonSegment(
                              value: 'unlocked_shortly',
                              tooltip: S.of(context).actionUnlockShortly,
                              icon: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.lock_clock_outlined,
                                      size: 50)),
                              enabled: enableSatates[2]),
                        ],
                        selected: <String>{door.state},
                        onSelectionChanged: (Set<String> newState) {
                          _changeState(newState.first);
                        },
                        showSelectedIcon: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SegmentedButton(
                        segments: <ButtonSegment<String>>[
                          ButtonSegment(
                              value: 'close',
                              tooltip: S.of(context).actionClose,
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.sensor_door_sharp,
                                  size: 50,
                                ),
                              ),
                              enabled: enableActions[0]),
                          ButtonSegment(
                              value: 'open',
                              tooltip: S.of(context).actionOpen,
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.meeting_room,
                                  size: 50,
                                ),
                              ),
                              enabled: enableActions[1]),
                        ],
                        selected: <String>{action},
                        onSelectionChanged: (Set<String> newAction) {
                          _changeAction(newAction.first);
                        },
                        showSelectedIcon: false,
                      )
                    ],
                  ),
                ),
                snapshot.connectionState != ConnectionState.done
                    ? Positioned(
                        top: screenSize.height * 0.3,
                        left: screenSize.width * 0.4,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 4,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : Container()
              ]);
            }),
        bottomNavigationBar: _buidNavigationBar());
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
