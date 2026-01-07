import 'package:exercise_flutter_acs/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'generated/l10n.dart';

class ScreeSchedule extends StatefulWidget {
  late UserGroup userGroup;
  ScreeSchedule({super.key, required this.userGroup});

  @override
  State<ScreeSchedule> createState() => _ScreeScheduleState();
}

class _ScreeScheduleState extends State<ScreeSchedule> {
  late UserGroup userGroup;
  late Schedule newSchedule;
  List<bool> weekdays = List.filled(7, false);
  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;

    newSchedule = userGroup.schedule;
    for (int day in newSchedule.weekdays) {
      if (day >= 0 && day < 7) {
        weekdays[day] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(S.of(context).scheduleTitle(userGroup.name)),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: Text(S.of(context).from)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(DateFormat('dd/MM/yy').format(newSchedule.fromDate)),
                    IconButton(
                        onPressed: () => _pickStartDate(),
                        icon: const Icon(Icons.calendar_today))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: Text(S.of(context).to)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(DateFormat('dd/MM/yy').format(newSchedule.toDate)),
                    IconButton(
                        onPressed: () => _pickEndDate(),
                        icon: const Icon(Icons.calendar_today))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).weekdays),
                    WeekdaySelector(
                        onChanged: (int day) => {
                              setState(() {
                                day = day % 7;
                                weekdays[day] = !weekdays[day];
                                newSchedule.weekdays.clear();

                                for (int i = 0; i < weekdays.length; i++) {
                                  if (weekdays[i]) {
                                    newSchedule.weekdays.add(i);
                                  }
                                }
                              })
                            },
                        values: weekdays)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: Text(S.of(context).from)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(newSchedule.fromTime.format(context)),
                    IconButton(
                        onPressed: () => _pickStartTime(),
                        icon: const Icon(Icons.watch_later_outlined))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: Text(S.of(context).to)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(newSchedule.toTime.format(context)),
                    IconButton(
                        onPressed: () => _pickEndTime(),
                        icon: const Icon(Icons.watch_later_outlined))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsetsGeometry.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          saveChanges();
                        },
                        child: Text(S.of(context).submit),
                      )),
                )
              ]),
        ),
      ),
    );
  }

  void saveChanges() {
    String? error = _validateForm();

    if (error != null) {
      _showAlert(S.of(context).incorrectData, error);
      return;
    }

    // Si tot és correcte, guardem
    newSchedule.weekdays.clear();
    for (int i = 0; i < weekdays.length; i++) {
      if (weekdays[i]) {
        newSchedule.weekdays.add(i);
      }
    }

    List<UserGroup> userGroups = Data.userGroups;
    if (userGroups.contains(userGroup)) {
      var index = userGroups.indexOf(userGroup);
      userGroups[index].schedule = newSchedule;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(S.of(context).saved)));
  }

  void _pickStartDate() async {
    DateTime initial = newSchedule.fromDate;
    DateTime first = DateTime(2000);

    DateTime? newStartDate = await showDatePicker(
        context: context,
        firstDate: first,
        lastDate: DateTime(DateTime.now().year + 10),
        initialDate: initial
    );

    if (newStartDate != null) {
      setState(() {
        newSchedule.fromDate = newStartDate;
      });
    }
  }

  void _pickEndDate() async {
    DateTime initial = newSchedule.toDate;
    DateTime first = DateTime(2000);

    DateTime? newEndDate = await showDatePicker(
        context: context,
        firstDate: first,
        lastDate: DateTime(DateTime.now().year + 10),
        initialDate: initial
    );

    if (newEndDate != null) {
      setState(() {
        newSchedule.toDate = newEndDate;
      });
    }
  }

  void _pickStartTime() async {
    TimeOfDay? newStartTime = await showTimePicker(
      context: context,
      initialTime: newSchedule.fromTime,
    );

    if (newStartTime != null) {
      setState(() {
        newSchedule.fromTime = newStartTime;
      });
    }
  }

  void _pickEndTime() async {
    TimeOfDay? newEndTime = await showTimePicker(
      context: context,
      initialTime: newSchedule.toTime,
    );

    if (newEndTime != null) {
      setState(() {
        newSchedule.toTime = newEndTime;
      });
    }
  }

  String? _validateForm() {
    // Validar Dates
    if (newSchedule.fromDate.isAfter(newSchedule.toDate)) {
      return S.of(context).dateError;
    }

    // Validar Hores
    int startMinutes = newSchedule.fromTime.hour * 60 + newSchedule.fromTime.minute;
    int endMinutes = newSchedule.toTime.hour * 60 + newSchedule.toTime.minute;

    if (startMinutes >= endMinutes) {
      return S.of(context).timeError;
    }

    return null;
  }

  void _showAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(message)],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).accept))
            ],
          );
        });
  }

}
