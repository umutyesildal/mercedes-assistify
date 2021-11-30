part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends PreferencesEvent {
  ThemeChangedEvent({required this.theme});

  final bool theme;

  @override
  List<Object> get props => [theme];
}

class GetThemeEvent extends PreferencesEvent {
  GetThemeEvent();

  @override
  List<Object> get props => [];
}

class GetLocaleEvent extends PreferencesEvent {
  GetLocaleEvent();

  @override
  List<Object> get props => [];
}

class LocaleChangedEvent extends PreferencesEvent {
  LocaleChangedEvent({required this.locale});

  final String? locale;

  @override
  List<Object> get props => [locale!];
}

class GetAuthEvent extends PreferencesEvent {
  GetAuthEvent();

  @override
  List<Object> get props => [];
}

class AuthChangedEvent extends PreferencesEvent {
  AuthChangedEvent({required this.auth});

  final bool? auth;

  @override
  List<Object> get props => [auth!];
}

class GetServiceEvent extends PreferencesEvent {
  GetServiceEvent();

  @override
  List<Object> get props => [];
}
