part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  const MainState({
    this.darkMode,
    this.isTheme = false,
    this.locale,
    this.auth = false,
  });
  final bool? darkMode;
  final bool isTheme;
  final String? locale;
  final bool? auth;

  MainState copywith({
    bool? darkMode,
    bool? isTheme,
    String? locale,
    bool? auth,
  }) {
    return MainState(
      darkMode: darkMode ?? this.darkMode,
      isTheme: isTheme ?? this.isTheme,
      locale: locale ?? this.locale,
      auth: auth ?? this.auth,
    );
  }

  @override
  List<Object?> get props => [darkMode, isTheme, locale, auth];
}

class MainInitial extends MainState {}
