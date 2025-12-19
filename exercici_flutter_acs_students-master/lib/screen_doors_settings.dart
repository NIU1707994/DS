import 'package:exercise_flutter_acs/requests.dart';
import 'package:exercise_flutter_acs/tree.dart';
import 'package:flutter/material.dart';

class ScreenDoorsSettings extends StatefulWidget {
  Door door;
  ScreenDoorsSettings({super.key, required this.door});

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

  @override
  void initState() {
    super.initState();
    door = widget.door;
    state = door.state;
    action = door.closed ? 'close' : 'open';

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
      default:
    }
  }

  Future<void> _changeState(String newState) async {
    setState(() {
      door.state = newState;
    });

    late String snackBarText;

    if (door.state == 'locked') {
      await lockDoor(door);

      _futureDoor = Future.value(door);

      snackBarText = "The door has been locked";
    } else if (door.state == 'unlocked') {
      await unlockDoor(door);

      _futureDoor = Future.value(door);

      snackBarText = "The door has been unlocked";
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackBarText)));

    setState(() {
      updateEnabledOption();
    });
  }

  void _changeAction(String newAction) async {
    setState(() {
      action = newAction;

      if (action == 'close') {
        door.closed = true;
      } else {
        door.closed = false;
      }
    });

    await openCloseDoor(door);

    _futureDoor = Future.value(door);

    setState(() {
      updateEnabledOption();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Door ${door.id}"),
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
                            tooltip: 'Locked',
                            icon: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.lock_outline,
                                size: 50,
                              ),
                            ),
                            enabled: enableSatates[0]),
                        ButtonSegment(
                            value: 'unlocked',
                            tooltip: 'Unlocked',
                            icon: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.lock_open,
                                size: 60,
                              ),
                            ),
                            enabled: enableSatates[1]),
                        ButtonSegment(
                            value: 'unlocked_shortly',
                            tooltip: 'Unlocked\nShortly',
                            icon: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child:
                                    Icon(Icons.lock_clock_outlined, size: 60)),
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
                            tooltip: 'Close',
                            icon: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.sensor_door_sharp,
                                size: 60,
                              ),
                            ),
                            enabled: enableActions[0]),
                        ButtonSegment(
                            value: 'open',
                            tooltip: 'Open',
                            icon: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.meeting_room,
                                size: 60,
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
                      child: Container(
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
    );
  }
}
