// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'ACS';

  @override
  String get places => 'Orte';

  @override
  String get groups => 'Gruppen';

  @override
  String get favorites => 'Favorites';

  @override
  String get propped => 'Propped';

  @override
  String get recent => 'Recent';

  @override
  String get userGroups => 'User groups';

  @override
  String usersTitle(Object name) {
    return 'Users $name';
  }

  @override
  String infoTitle(Object name) {
    return 'Info $name';
  }

  @override
  String scheduleTitle(Object name) {
    return 'Schedule $name';
  }

  @override
  String get actions => 'Aktionen';

  @override
  String get users => 'Benutzer';

  @override
  String get info => 'Info';

  @override
  String get schedule => 'Zeitplan';

  @override
  String get submit => 'Bestätigen';

  @override
  String get saved => 'Gespeichert!';

  @override
  String get nameGroup => 'Namensgruppe';

  @override
  String get description => 'Beschreibung';

  @override
  String get enterText => 'Bitte geben Sie einen Text ein';

  @override
  String get actionsSaved => 'Aktionen korrekt gespeichert!';

  @override
  String doorTitle(Object id) {
    return 'Tür $id';
  }

  @override
  String get doorLocked => 'Die Tür ist verschlossen';

  @override
  String get doorUnlocked => 'Die Tür ist unverschlossen';

  @override
  String get doorUnlockedShortly => 'Die Tür wurde vor kurzem entriegelt';

  @override
  String get doorClosed => 'Die Tür ist geschlossen';

  @override
  String get doorOpened => 'Die Tür ist geöffnet';

  @override
  String get areaLockedCorrectly => 'Bereich korrekt gesperrt';

  @override
  String get areaUnlockedCorrectly => 'Bereich korrekt entsperrt';

  @override
  String errorPropCheck(Object action) {
    return 'Es ist nicht möglich, mit dem Befehl $action zu prüfen, ob eine Tür blockiert ist';
  }

  @override
  String get noProppedDoors => 'Es gibt keine abgestützten Türen';

  @override
  String get noFavorites => 'Noch keine Favoriten';

  @override
  String get from => 'Von';

  @override
  String get to => 'Bis';

  @override
  String get weekdays => 'Wochentage';

  @override
  String get accept => 'Akzeptieren';

  @override
  String get incorrectData => 'Falsche Daten';

  @override
  String get dateError => 'Das Startdatum muss vor dem Enddatum liegen.';

  @override
  String get timeError => 'Die Startzeit muss vor der Endzeit liegen.';

  @override
  String get user => 'Benutzer';

  @override
  String get name => 'Name';

  @override
  String get credential => 'Anmeldedaten';
}
