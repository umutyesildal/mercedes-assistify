part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  const MainState({
    this.darkMode,
    this.isTheme = false,
    this.locale,
    this.auth = false,
    this.currentCar,
  });
  final bool? darkMode;
  final bool isTheme;
  final String? locale;
  final bool? auth;
  final CarEntity? currentCar;

  MainState copywith({
    bool? darkMode,
    bool? isTheme,
    String? locale,
    bool? auth,
    CarEntity? currentCar,
  }) {
    return MainState(
      darkMode: darkMode ?? this.darkMode,
      isTheme: isTheme ?? this.isTheme,
      locale: locale ?? this.locale,
      auth: auth ?? this.auth,
      currentCar: currentCar ?? this.currentCar,
    );
  }

  @override
  List<Object?> get props => [darkMode, isTheme, locale, auth, currentCar];
}

class MainInitial extends MainState {}
