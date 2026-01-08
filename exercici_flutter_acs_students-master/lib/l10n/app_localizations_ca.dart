// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'ACS';

  @override
  String get places => 'Espais';

  @override
  String get groups => 'Grups';

  @override
  String get favorites => 'Preferits';

  @override
  String get propped => 'Obertes';

  @override
  String get recent => 'Recent';

  @override
  String get userGroups => 'Grups d\'usuaris';

  @override
  String usersTitle(Object name) {
    return 'Usuaris $name';
  }

  @override
  String infoTitle(Object name) {
    return 'Info $name';
  }

  @override
  String scheduleTitle(Object name) {
    return 'Horari $name';
  }

  @override
  String get actions => 'Accions';

  @override
  String get users => 'Usuaris';

  @override
  String get info => 'Info';

  @override
  String get schedule => 'Horari';

  @override
  String get submit => 'Enviar';

  @override
  String get saved => 'Guardat!';

  @override
  String get nameGroup => 'Nom del Grup';

  @override
  String get description => 'Descripció';

  @override
  String get enterText => 'Si us plau, introdueix text';

  @override
  String get actionsSaved => 'Accions guardades correctament!';

  @override
  String doorTitle(Object id) {
    return 'Porta $id';
  }

  @override
  String get doorLocked => 'La porta s\'ha bloquejat';

  @override
  String get doorUnlocked => 'La porta s\'ha desbloquejat';

  @override
  String get doorUnlockedShortly => 'La porta s\'ha desbloquejat temporalment';

  @override
  String get doorClosed => 'La porta s\'ha tancat';

  @override
  String get doorOpened => 'La porta s\'ha obert';

  @override
  String get areaLockedCorrectly => 'Àrea bloquejada correctament';

  @override
  String get areaUnlockedCorrectly => 'Àrea desbloquejada correctament';

  @override
  String errorPropCheck(Object action) {
    return 'No es pot fer l\'acció \'$action\', revisa si hi ha portes forçades o desbloquejades temporalment';
  }

  @override
  String get noProppedDoors => 'No hi ha portes forçades';

  @override
  String get noFavorites => 'No hi ha preferits';

  @override
  String get from => 'De';

  @override
  String get to => 'A';

  @override
  String get weekdays => 'Dies setmana';

  @override
  String get accept => 'Acceptar';

  @override
  String get incorrectData => 'Dades incorrectes';

  @override
  String get dateError => 'La data d\'inici ha de ser anterior a la final.';

  @override
  String get timeError => 'L\'hora d\'inici ha de ser anterior a la final.';

  @override
  String get user => 'Usuari';

  @override
  String get name => 'Nom';

  @override
  String get credential => 'Credencial';
}
