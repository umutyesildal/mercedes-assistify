


import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get language => 'Türkçe';

  @override
  String get helloWorld => 'Merhaba Dünya!';

  @override
  String hello(String username) {
    return 'Merhaba $username';
  }

  @override
  String get landing => 'Arabam';

  @override
  String get yourFavorites => 'En Yakın Servis';

  @override
  String get settings => 'Ayarlar';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get appearance => 'Görünüm';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get theme => 'Tema';

  @override
  String get darkMode => 'Karanlık Tema';

  @override
  String get languageAndCountry => 'Dil & Ülke';

  @override
  String get help => 'Yardım';

  @override
  String get legal => 'Hukuki';

  @override
  String get logout => 'Çıkış';
}
