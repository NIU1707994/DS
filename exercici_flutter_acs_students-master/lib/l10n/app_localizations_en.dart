// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ACS';

  @override
  String get places => 'Places';

  @override
  String get groups => 'Groups';

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
  String get actions => 'Actions';

  @override
  String get users => 'Users';

  @override
  String get info => 'Info';

  @override
  String get schedule => 'Schedule';

  @override
  String get submit => 'Submit';

  @override
  String get saved => 'Saved!';

  @override
  String get nameGroup => 'Name Group';

  @override
  String get description => 'Description';

  @override
  String get enterText => 'Please enter some text';

  @override
  String get actionsSaved => 'Actions saved correctly!';

  @override
  String doorTitle(Object id) {
    return 'Door $id';
  }

  @override
  String get doorLocked => 'The door has been locked';

  @override
  String get doorUnlocked => 'The door has been unlocked';

  @override
  String get doorUnlockedShortly => 'The door has been unlocked shortly';

  @override
  String get doorClosed => 'The door has been closed';

  @override
  String get doorOpened => 'The door has been opened';

  @override
  String get areaLockedCorrectly => 'Area locked correctly';

  @override
  String get areaUnlockedCorrectly => 'Area unlocked correctly';

  @override
  String errorPropCheck(Object action) {
    return 'Not possible to $action check if any door is propped';
  }

  @override
  String get noProppedDoors => 'There are no propped doors';

  @override
  String get noFavorites => 'No favorites yet';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get weekdays => 'Weekdays';

  @override
  String get accept => 'Accept';

  @override
  String get incorrectData => 'Incorrect data';

  @override
  String get dateError => 'Start date must be before end date.';

  @override
  String get timeError => 'Start time must be before end time.';

  @override
  String get user => 'User';

  @override
  String get name => 'Name';

  @override
  String get credential => 'Credential';
}
