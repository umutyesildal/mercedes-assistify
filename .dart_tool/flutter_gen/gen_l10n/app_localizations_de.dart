


import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get language => 'Deutsch';

  @override
  String get helloWorld => 'Hallo Welt!';

  @override
  String hello(String username) {
    return 'Hallo $username';
  }

  @override
  String get landing => 'Mein Auto';

  @override
  String get yourFavorites => 'nächste Händler';

  @override
  String get settings => 'Einstellungen';

  @override
  String get notifications => 'Benachrichtigung';

  @override
  String get appearance => 'Aussicht';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get theme => 'Thema';

  @override
  String get darkMode => 'Dunkelmodus';

  @override
  String get languageAndCountry => 'Sprache & Land';

  @override
  String get help => 'Hilfe';

  @override
  String get legal => 'Legal';

  @override
  String get logout => 'Ausloggen';
}
