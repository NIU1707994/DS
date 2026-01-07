// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(id) => "Tür ${id}";

  static String m1(action) =>
      "Aktion \'${action}\' nicht möglich, prüfen Sie auf offene Türen";

  static String m2(name) => "Info ${name}";

  static String m3(name) => "Zeitplan ${name}";

  static String m4(name) => "Benutzer ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Akzeptieren"),
    "actionClose": MessageLookupByLibrary.simpleMessage("Schließen"),
    "actionLock": MessageLookupByLibrary.simpleMessage("Verriegeln"),
    "actionOpen": MessageLookupByLibrary.simpleMessage("Öffnen"),
    "actionUnlock": MessageLookupByLibrary.simpleMessage("Entsperren"),
    "actionUnlockShortly": MessageLookupByLibrary.simpleMessage(
      "Kurz entsperren",
    ),
    "actions": MessageLookupByLibrary.simpleMessage("Aktionen"),
    "actionsSaved": MessageLookupByLibrary.simpleMessage(
      "Aktionen erfolgreich gespeichert!",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ACS"),
    "areaLockedCorrectly": MessageLookupByLibrary.simpleMessage(
      "Bereich korrekt verriegelt",
    ),
    "areaUnlockedCorrectly": MessageLookupByLibrary.simpleMessage(
      "Bereich korrekt entriegelt",
    ),
    "credential": MessageLookupByLibrary.simpleMessage("Ausweis"),
    "dateError": MessageLookupByLibrary.simpleMessage(
      "Startdatum muss vor Enddatum liegen.",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Beschreibung"),
    "doorClosed": MessageLookupByLibrary.simpleMessage(
      "Die Tür wurde geschlossen",
    ),
    "doorLocked": MessageLookupByLibrary.simpleMessage(
      "Die Tür wurde verriegelt",
    ),
    "doorOpened": MessageLookupByLibrary.simpleMessage(
      "Die Tür wurde geöffnet",
    ),
    "doorTitle": m0,
    "doorUnlocked": MessageLookupByLibrary.simpleMessage(
      "Die Tür wurde entriegelt",
    ),
    "doorUnlockedShortly": MessageLookupByLibrary.simpleMessage(
      "Die Tür wurde kurzzeitig entriegelt",
    ),
    "enterText": MessageLookupByLibrary.simpleMessage("Bitte Text eingeben"),
    "errorPropCheck": m1,
    "favorites": MessageLookupByLibrary.simpleMessage("Favoriten"),
    "from": MessageLookupByLibrary.simpleMessage("Von"),
    "groups": MessageLookupByLibrary.simpleMessage("Gruppen"),
    "incorrectData": MessageLookupByLibrary.simpleMessage("Falsche Daten"),
    "info": MessageLookupByLibrary.simpleMessage("Info"),
    "infoTitle": m2,
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameGroup": MessageLookupByLibrary.simpleMessage("Gruppenname"),
    "noFavorites": MessageLookupByLibrary.simpleMessage("Keine Favoriten"),
    "noProppedDoors": MessageLookupByLibrary.simpleMessage(
      "Keine offenen Türen",
    ),
    "places": MessageLookupByLibrary.simpleMessage("Orte"),
    "propped": MessageLookupByLibrary.simpleMessage("Offen"),
    "recent": MessageLookupByLibrary.simpleMessage("Kürzlich"),
    "saved": MessageLookupByLibrary.simpleMessage("Gespeichert!"),
    "schedule": MessageLookupByLibrary.simpleMessage("Zeitplan"),
    "scheduleTitle": m3,
    "submit": MessageLookupByLibrary.simpleMessage("Bestätigen"),
    "timeError": MessageLookupByLibrary.simpleMessage(
      "Startzeit muss vor Endzeit liegen.",
    ),
    "to": MessageLookupByLibrary.simpleMessage("Bis"),
    "user": MessageLookupByLibrary.simpleMessage("Benutzer"),
    "userGroups": MessageLookupByLibrary.simpleMessage("Benutzergruppen"),
    "users": MessageLookupByLibrary.simpleMessage("Benutzer"),
    "usersTitle": m4,
    "weekdays": MessageLookupByLibrary.simpleMessage("Wochentage"),
  };
}
