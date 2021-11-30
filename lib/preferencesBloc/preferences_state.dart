part of 'preferences_bloc.dart';

@immutable
class PreferencesState extends Equatable {
  const PreferencesState({
    this.darkMode,
    this.isTheme = false,
    this.locale,
    this.auth = false,
  });
  final bool? darkMode;
  final bool isTheme;
  final String? locale;
  final bool? auth;

  PreferencesState copyWith({
    bool? darkMode,
    bool? isTheme,
    String? locale,
    bool? auth,
  }) {
    return PreferencesState(
      darkMode: darkMode ?? this.darkMode,
      isTheme: isTheme ?? this.isTheme,
      locale: locale ?? this.locale,
      auth: auth ?? this.auth,
    );
  }

  @override
  List<Object?> get props => [darkMode, isTheme, locale, auth];
}
