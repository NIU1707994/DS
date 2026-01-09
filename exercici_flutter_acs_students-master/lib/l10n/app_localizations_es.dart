// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'ACS';

  @override
  String get places => 'Lugares';

  @override
  String get groups => 'Grupos';

  @override
  String get favorites => 'Favoritos';

  @override
  String get propped => 'Forzadas';

  @override
  String get recent => 'Recientes';

  @override
  String get userGroups => 'Grupos de usuario';

  @override
  String usersTitle(Object name) {
    return 'Usuarios $name';
  }

  @override
  String infoTitle(Object name) {
    return 'Información $name';
  }

  @override
  String scheduleTitle(Object name) {
    return 'Programación $name';
  }

  @override
  String get actions => 'Acciones';

  @override
  String get users => 'Usuarios';

  @override
  String get info => 'Información';

  @override
  String get schedule => 'Programación';

  @override
  String get submit => 'Confirmar';

  @override
  String get saved => '¡Guardado!';

  @override
  String get nameGroup => 'Grupo de nombre';

  @override
  String get description => 'Descripción';

  @override
  String get enterText => 'Por favor, introduzca un texto';

  @override
  String get actionsSaved => '¡Acciones guardadas correctamente!';

  @override
  String doorTitle(Object id) {
    return 'Puerta $id';
  }

  @override
  String get doorLocked => 'La puerta está cerrada';

  @override
  String get doorUnlocked => 'La puerta está abierta';

  @override
  String get doorUnlockedShortly => 'La puerta se abrió hace poco';

  @override
  String get doorClosed => 'La puerta está cerrada';

  @override
  String get doorOpened => 'La puerta está abierta';

  @override
  String get areaLockedCorrectly => 'Área bloqueada correctamente';

  @override
  String get areaUnlockedCorrectly => 'Área desbloqueada correctamente';

  @override
  String errorPropCheck(Object action) {
    return 'No es posible verificar si una puerta está asegurada con el comando $action';
  }

  @override
  String get noProppedDoors => 'No hay puertas aseguradas';

  @override
  String get noFavorites => 'Aún no hay favoritos';

  @override
  String get from => 'Desde';

  @override
  String get to => 'Hasta';

  @override
  String get weekdays => 'Días de la semana';

  @override
  String get accept => 'Aceptar';

  @override
  String get incorrectData => 'Datos incorrectos';

  @override
  String get dateError =>
      'La fecha de inicio debe ser anterior a la fecha de fin.';

  @override
  String get timeError =>
      'La hora de inicio debe ser anterior a la hora de fin.';

  @override
  String get user => 'Usuario';

  @override
  String get name => 'Nombre';

  @override
  String get credential => 'Credenciales';
}
