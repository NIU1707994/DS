import 'package:exercise_flutter_acs/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weekday_selector/weekday_selector.dart';

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
      if (day >= 1 && day <= 7) {
        weekdays[day - 1] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Schedule ${userGroup.name}"),
        leading: IconButton(
            onPressed: () => {Navigator.of(context).pop()},
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: const Text("From")),
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
                        child: const Text("To")),
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
                    const Text("Weekdays"),
                    WeekdaySelector(
                        onChanged: (int day) => {
                              setState(() {
                                weekdays[day] = !weekdays[day];
                                newSchedule.weekdays.clear();

                                for (int i = 0; i < weekdays.length; i++) {
                                  if (weekdays[i]) {
                                    newSchedule.weekdays.add(i + 1);
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
                        child: const Text("From")),
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
                        child: const Text("To")),
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
                        child: const Text("Sumbit"),
                      )),
                )
              ]),
        ),
      ),
    );
  }

  void saveChanges() {
    for (int i = 0; i < weekdays.length; i++) {
      if (weekdays[i]) {
        newSchedule.weekdays.add(i + 1);
      }
    }
    List<UserGroup> userGroups = Data.userGroups;
    if (userGroups.contains(userGroup)) {
      var index = userGroups.indexOf(userGroup);
      userGroups[index].schedule = newSchedule;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Saved!")));
  }

  void _pickStartDate() async {
    DateTime? newStartDate = await showDatePicker(
        context: context,
        firstDate: DateTime(newSchedule.fromDate.year),
        lastDate: DateTime(newSchedule.fromDate.year + 5),
        initialDate: newSchedule.fromDate);
    setState(() {
      if (newStartDate!.isAfter(newSchedule.toDate)) {
        _showAlert("Rande dates", "From date is after toDate");
      } else {
        newSchedule.fromDate = newStartDate;
      }
    });
  }

  void _pickStartTime() async {
    TimeOfDay? newStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: newSchedule.fromTime.hour, minute: newSchedule.fromTime.minute),
    );
    setState(() {
      newSchedule.fromTime = newStartTime!;
    });
  }

  void _pickEndDate() async {
    DateTime? newEndDate = await showDatePicker(
        context: context,
        firstDate: DateTime(newSchedule.toDate.year),
        lastDate: DateTime(newSchedule.toDate.year + 5),
        initialDate: newSchedule.toDate);
    setState(() {
      if (newEndDate!.isAfter(newSchedule.fromDate)) {
        newSchedule.toDate = newEndDate;
      } else {
        _showAlert("Rande dates", "From date is after toDate");
      }
    });
  }

  void _pickEndTime() async {
    TimeOfDay? newEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: newSchedule.toTime.hour, minute: newSchedule.toTime.minute),
    );
    setState(() {
      newSchedule.toTime = newEndTime!;
    });
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
                  child: const Text("Accept"))
            ],
          );
        });
  }
}
