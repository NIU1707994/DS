// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ca locale. All the
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
  String get localeName => 'ca';

  static String m0(id) => "Porta ${id}";

  static String m1(action) =>
      "No es pot fer l\'acció \'${action}\', revisa si hi ha portes forçades";

  static String m2(name) => "Info ${name}";

  static String m3(name) => "Horari ${name}";

  static String m4(name) => "Usuaris ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Acceptar"),
    "actionClose": MessageLookupByLibrary.simpleMessage("Tancar"),
    "actionLock": MessageLookupByLibrary.simpleMessage("Bloquejar"),
    "actionOpen": MessageLookupByLibrary.simpleMessage("Obrir"),
    "actionUnlock": MessageLookupByLibrary.simpleMessage("Desbloquejar"),
    "actionUnlockShortly": MessageLookupByLibrary.simpleMessage(
      "Desbloquejar temporalment",
    ),
    "actions": MessageLookupByLibrary.simpleMessage("Accions"),
    "actionsSaved": MessageLookupByLibrary.simpleMessage(
      "Accions guardades correctament!",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ACS"),
    "areaLockedCorrectly": MessageLookupByLibrary.simpleMessage(
      "Àrea bloquejada correctament",
    ),
    "areaUnlockedCorrectly": MessageLookupByLibrary.simpleMessage(
      "Àrea desbloquejada correctament",
    ),
    "credential": MessageLookupByLibrary.simpleMessage("Credencial"),
    "dateError": MessageLookupByLibrary.simpleMessage(
      "La data d\'inici ha de ser anterior a la final.",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Descripció"),
    "doorClosed": MessageLookupByLibrary.simpleMessage("La porta s\'ha tancat"),
    "doorLocked": MessageLookupByLibrary.simpleMessage(
      "La porta s\'ha bloquejat",
    ),
    "doorOpened": MessageLookupByLibrary.simpleMessage("La porta s\'ha obert"),
    "doorTitle": m0,
    "doorUnlocked": MessageLookupByLibrary.simpleMessage(
      "La porta s\'ha desbloquejat",
    ),
    "doorUnlockedShortly": MessageLookupByLibrary.simpleMessage(
      "La porta s\'ha desbloquejat temporalment",
    ),
    "enterText": MessageLookupByLibrary.simpleMessage(
      "Si us plau, introdueix text",
    ),
    "errorPropCheck": m1,
    "favorites": MessageLookupByLibrary.simpleMessage("Preferits"),
    "from": MessageLookupByLibrary.simpleMessage("De"),
    "groups": MessageLookupByLibrary.simpleMessage("Grups"),
    "incorrectData": MessageLookupByLibrary.simpleMessage("Dades incorrectes"),
    "info": MessageLookupByLibrary.simpleMessage("Info"),
    "infoTitle": m2,
    "name": MessageLookupByLibrary.simpleMessage("Nom"),
    "nameGroup": MessageLookupByLibrary.simpleMessage("Nom del Grup"),
    "noFavorites": MessageLookupByLibrary.simpleMessage("No hi ha preferits"),
    "noProppedDoors": MessageLookupByLibrary.simpleMessage(
      "No hi ha portes forçades",
    ),
    "places": MessageLookupByLibrary.simpleMessage("Espais"),
    "propped": MessageLookupByLibrary.simpleMessage("Forçades"),
    "recent": MessageLookupByLibrary.simpleMessage("Recent"),
    "saved": MessageLookupByLibrary.simpleMessage("Guardat!"),
    "schedule": MessageLookupByLibrary.simpleMessage("Horari"),
    "scheduleTitle": m3,
    "submit": MessageLookupByLibrary.simpleMessage("Enviar"),
    "timeError": MessageLookupByLibrary.simpleMessage(
      "L\'hora d\'inici ha de ser anterior a la final.",
    ),
    "to": MessageLookupByLibrary.simpleMessage("A"),
    "user": MessageLookupByLibrary.simpleMessage("Usuari"),
    "userGroups": MessageLookupByLibrary.simpleMessage("Grups d\'usuaris"),
    "users": MessageLookupByLibrary.simpleMessage("Usuaris"),
    "usersTitle": m4,
    "weekdays": MessageLookupByLibrary.simpleMessage("Dies setmana"),
  };
}
