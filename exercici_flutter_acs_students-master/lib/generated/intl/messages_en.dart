// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(id) => "Door ${id}";

  static String m1(action) =>
      "Not possible to ${action} check if any door is propped";

  static String m2(name) => "Info ${name}";

  static String m3(name) => "Schedule ${name}";

  static String m4(name) => "Users ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "actionClose": MessageLookupByLibrary.simpleMessage("Close"),
    "actionLock": MessageLookupByLibrary.simpleMessage("Lock"),
    "actionOpen": MessageLookupByLibrary.simpleMessage("Open"),
    "actionUnlock": MessageLookupByLibrary.simpleMessage("Unlock"),
    "actionUnlockShortly": MessageLookupByLibrary.simpleMessage(
      "Unlock Shortly",
    ),
    "actions": MessageLookupByLibrary.simpleMessage("Actions"),
    "actionsSaved": MessageLookupByLibrary.simpleMessage(
      "Actions saved correctly!",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ACS"),
    "areaLockedCorrectly": MessageLookupByLibrary.simpleMessage(
      "Area locked correctly",
    ),
    "areaUnlockedCorrectly": MessageLookupByLibrary.simpleMessage(
      "Area unlocked correctly",
    ),
    "credential": MessageLookupByLibrary.simpleMessage("Credential"),
    "dateError": MessageLookupByLibrary.simpleMessage(
      "Start date must be before end date.",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "doorClosed": MessageLookupByLibrary.simpleMessage(
      "The door has been closed",
    ),
    "doorLocked": MessageLookupByLibrary.simpleMessage(
      "The door has been locked",
    ),
    "doorOpened": MessageLookupByLibrary.simpleMessage(
      "The door has been opened",
    ),
    "doorTitle": m0,
    "doorUnlocked": MessageLookupByLibrary.simpleMessage(
      "The door has been unlocked",
    ),
    "doorUnlockedShortly": MessageLookupByLibrary.simpleMessage(
      "The door has been unlocked shortly",
    ),
    "enterText": MessageLookupByLibrary.simpleMessage("Please enter some text"),
    "errorPropCheck": m1,
    "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
    "from": MessageLookupByLibrary.simpleMessage("From"),
    "groups": MessageLookupByLibrary.simpleMessage("Groups"),
    "incorrectData": MessageLookupByLibrary.simpleMessage("Incorrect data"),
    "info": MessageLookupByLibrary.simpleMessage("Info"),
    "infoTitle": m2,
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameGroup": MessageLookupByLibrary.simpleMessage("Name Group"),
    "noFavorites": MessageLookupByLibrary.simpleMessage("No favorites yet"),
    "noProppedDoors": MessageLookupByLibrary.simpleMessage(
      "There are no propped doors",
    ),
    "places": MessageLookupByLibrary.simpleMessage("Places"),
    "propped": MessageLookupByLibrary.simpleMessage("Propped"),
    "recent": MessageLookupByLibrary.simpleMessage("Recent"),
    "saved": MessageLookupByLibrary.simpleMessage("Saved!"),
    "schedule": MessageLookupByLibrary.simpleMessage("Schedule"),
    "scheduleTitle": m3,
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "timeError": MessageLookupByLibrary.simpleMessage(
      "Start time must be before end time.",
    ),
    "to": MessageLookupByLibrary.simpleMessage("To"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "userGroups": MessageLookupByLibrary.simpleMessage("User groups"),
    "users": MessageLookupByLibrary.simpleMessage("Users"),
    "usersTitle": m4,
    "weekdays": MessageLookupByLibrary.simpleMessage("Weekdays"),
  };
}
