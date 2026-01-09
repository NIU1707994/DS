// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ACS`
  String get appTitle {
    return Intl.message('ACS', name: 'appTitle', desc: '', args: []);
  }

  /// `Places`
  String get places {
    return Intl.message('Places', name: 'places', desc: '', args: []);
  }

  /// `Groups`
  String get groups {
    return Intl.message('Groups', name: 'groups', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Propped`
  String get propped {
    return Intl.message('Propped', name: 'propped', desc: '', args: []);
  }

  /// `Recent`
  String get recent {
    return Intl.message('Recent', name: 'recent', desc: '', args: []);
  }

  /// `User groups`
  String get userGroups {
    return Intl.message('User groups', name: 'userGroups', desc: '', args: []);
  }

  /// `Users {name}`
  String usersTitle(Object name) {
    return Intl.message(
      'Users $name',
      name: 'usersTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Info {name}`
  String infoTitle(Object name) {
    return Intl.message(
      'Info $name',
      name: 'infoTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Schedule {name}`
  String scheduleTitle(Object name) {
    return Intl.message(
      'Schedule $name',
      name: 'scheduleTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message('Actions', name: 'actions', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Info`
  String get info {
    return Intl.message('Info', name: 'info', desc: '', args: []);
  }

  /// `Schedule`
  String get schedule {
    return Intl.message('Schedule', name: 'schedule', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Saved!`
  String get saved {
    return Intl.message('Saved!', name: 'saved', desc: '', args: []);
  }

  /// `Name Group`
  String get nameGroup {
    return Intl.message('Name Group', name: 'nameGroup', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Please enter some text`
  String get enterText {
    return Intl.message(
      'Please enter some text',
      name: 'enterText',
      desc: '',
      args: [],
    );
  }

  /// `Actions saved correctly!`
  String get actionsSaved {
    return Intl.message(
      'Actions saved correctly!',
      name: 'actionsSaved',
      desc: '',
      args: [],
    );
  }

  /// `Door {id}`
  String doorTitle(Object id) {
    return Intl.message('Door $id', name: 'doorTitle', desc: '', args: [id]);
  }

  /// `The door has been locked`
  String get doorLocked {
    return Intl.message(
      'The door has been locked',
      name: 'doorLocked',
      desc: '',
      args: [],
    );
  }

  /// `The door has been unlocked`
  String get doorUnlocked {
    return Intl.message(
      'The door has been unlocked',
      name: 'doorUnlocked',
      desc: '',
      args: [],
    );
  }

  /// `The door has been unlocked shortly`
  String get doorUnlockedShortly {
    return Intl.message(
      'The door has been unlocked shortly',
      name: 'doorUnlockedShortly',
      desc: '',
      args: [],
    );
  }

  /// `The door has been closed`
  String get doorClosed {
    return Intl.message(
      'The door has been closed',
      name: 'doorClosed',
      desc: '',
      args: [],
    );
  }

  /// `The door has been opened`
  String get doorOpened {
    return Intl.message(
      'The door has been opened',
      name: 'doorOpened',
      desc: '',
      args: [],
    );
  }

  /// `Area locked correctly`
  String get areaLockedCorrectly {
    return Intl.message(
      'Area locked correctly',
      name: 'areaLockedCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Area unlocked correctly`
  String get areaUnlockedCorrectly {
    return Intl.message(
      'Area unlocked correctly',
      name: 'areaUnlockedCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Not possible to {action} check if any door is propped`
  String errorPropCheck(Object action) {
    return Intl.message(
      'Not possible to $action check if any door is propped',
      name: 'errorPropCheck',
      desc: '',
      args: [action],
    );
  }

  /// `There are no propped doors`
  String get noProppedDoors {
    return Intl.message(
      'There are no propped doors',
      name: 'noProppedDoors',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get noFavorites {
    return Intl.message(
      'No favorites yet',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Weekdays`
  String get weekdays {
    return Intl.message('Weekdays', name: 'weekdays', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Incorrect data`
  String get incorrectData {
    return Intl.message(
      'Incorrect data',
      name: 'incorrectData',
      desc: '',
      args: [],
    );
  }

  /// `Start date must be before end date.`
  String get dateError {
    return Intl.message(
      'Start date must be before end date.',
      name: 'dateError',
      desc: '',
      args: [],
    );
  }

  /// `Start time must be before end time.`
  String get timeError {
    return Intl.message(
      'Start time must be before end time.',
      name: 'timeError',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Credential`
  String get credential {
    return Intl.message('Credential', name: 'credential', desc: '', args: []);
  }

  /// `Open`
  String get actionOpen {
    return Intl.message('Open', name: 'actionOpen', desc: '', args: []);
  }

  /// `Close`
  String get actionClose {
    return Intl.message('Close', name: 'actionClose', desc: '', args: []);
  }

  /// `Lock`
  String get actionLock {
    return Intl.message('Lock', name: 'actionLock', desc: '', args: []);
  }

  /// `Unlock`
  String get actionUnlock {
    return Intl.message('Unlock', name: 'actionUnlock', desc: '', args: []);
  }

  /// `Unlock Shortly`
  String get actionUnlockShortly {
    return Intl.message(
      'Unlock Shortly',
      name: 'actionUnlockShortly',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'cat'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
