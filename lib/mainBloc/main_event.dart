part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends MainEvent {
  ThemeChangedEvent({required this.theme});

  final bool theme;

  @override
  List<Object> get props => [theme];
}

class GetThemeEvent extends MainEvent {
  GetThemeEvent();

  @override
  List<Object> get props => [];
}

class GetLocaleEvent extends MainEvent {
  GetLocaleEvent();

  @override
  List<Object> get props => [];
}

class LocaleChangedEvent extends MainEvent {
  LocaleChangedEvent({required this.locale});

  final String? locale;

  @override
  List<Object> get props => [locale!];
}

class GetAuthEvent extends MainEvent {
  GetAuthEvent();

  @override
  List<Object> get props => [];
}

class AuthChangedEvent extends MainEvent {
  AuthChangedEvent({required this.auth});

  final bool? auth;

  @override
  List<Object> get props => [auth!];
}


class GetCarEvent extends MainEvent {
  GetCarEvent();

  @override
  List<Object> get props => [];
}
