import 'package:exercise_flutter_acs/data.dart';
import 'package:exercise_flutter_acs/screen_action_list.dart';
import 'package:exercise_flutter_acs/screen_list_places.dart';
import 'package:exercise_flutter_acs/screen_schedule.dart';
import 'package:exercise_flutter_acs/screen_info_user_group.dart';
import 'package:flutter/material.dart';
import 'screen_list_users.dart';
import 'generated/l10n.dart';

class ScreenGroupOptions extends StatefulWidget {
  UserGroup userGroup;
  ScreenGroupOptions({super.key, required this.userGroup});

  @override
  State<ScreenGroupOptions> createState() => _ScreenGroupOptionsState();
}

class _ScreenGroupOptionsState extends State<ScreenGroupOptions> {
  late UserGroup userGroup;
  late String _appBarName;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup; // the userGroup of ScreenListGroups
    _appBarName = userGroup.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(S.of(context).usersTitle(_appBarName)),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            InkWell(
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute<void>(
                        builder: (context) =>
                            ScreenInfoUserGroup(userGroup: userGroup)))
                    .then((newUserGroup) => setState(() {
                          userGroup = newUserGroup as UserGroup;
                          _appBarName = userGroup.name;
                        }))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.article_outlined,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).info,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreeSchedule(userGroup: userGroup)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).schedule,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) =>
                        ScreenActionList(userGroup: userGroup)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.room_preferences_outlined,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).actions,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreenListPlaces(id: userGroup.name)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.holiday_village,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).places,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreeListUsers(userGroup: userGroup)))
              },
              child: Card(
                color: Colors.grey.shade700,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.manage_accounts,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        S.of(context).users,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
