


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get helloWorld => 'Hello World!';

  @override
  String hello(String username) {
    return 'Hello $username';
  }

  @override
  String get landing => 'My Car';

  @override
  String get yourFavorites => 'Closest Dealers';

  @override
  String get settings => 'Settings';

  @override
  String get notifications => 'Notifications';

  @override
  String get appearance => 'Appearance';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get languageAndCountry => 'Language & Country';

  @override
  String get help => 'Help';

  @override
  String get legal => 'Legal';

  @override
  String get logout => 'Log Out';
}
