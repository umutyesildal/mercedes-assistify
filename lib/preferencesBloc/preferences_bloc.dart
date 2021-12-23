import 'dart:async';
import 'package:car_repository/template_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';
import 'package:ownership_repository/ownership_repository.dart';
import 'package:service_repository/template_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc(
      {required this.localStorageRepository,
      required this.carRepository,
      required this.serviceRepository})
      : super(PreferencesState());

  final LocalStorage localStorageRepository;
  final CarRepository carRepository;
  final ServiceRepository serviceRepository;

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    if (event is ThemeChangedEvent) {
      yield* _mapThemeChangedState(event, state);
    } else if (event is GetThemeEvent) {
      yield* _mapGetThemeState(event, state);
    } else if (event is GetLocaleEvent) {
      yield* _mapGetLocaleState(event, state);
    } else if (event is LocaleChangedEvent) {
      yield* _mapLocaleChangedState(event, state);
    } else if (event is GetAuthEvent) {
      yield* _mapGetAuthState(event, state);
    } else if (event is AuthChangedEvent) {
      yield* _mapAuthChangedState(event, state);
    }
  }

  Stream<PreferencesState> _mapThemeChangedState(
      ThemeChangedEvent event, PreferencesState state) async* {
    print('Theme Changed');
    await localStorageRepository.changeTheme(theme: event.theme);

    yield state.copyWith(darkMode: event.theme);
  }

  Stream<PreferencesState> _mapGetThemeState(
      GetThemeEvent event, PreferencesState state) async* {
    print('Getting Theme');
    bool? darkMode = await localStorageRepository.getTheme();

    yield state.copyWith(darkMode: darkMode, isTheme: true);
  }

  Stream<PreferencesState> _mapGetLocaleState(
      GetLocaleEvent event, PreferencesState state) async* {
    print('Getting Locale');
    String? locale = await localStorageRepository.getLocale();

    yield state.copyWith(locale: locale);
  }

  Stream<PreferencesState> _mapLocaleChangedState(
      LocaleChangedEvent event, PreferencesState state) async* {
    print('Locale Changed');
    await localStorageRepository.changeLocale(locale: event.locale!);
    yield state.copyWith(locale: event.locale);
  }

  Stream<PreferencesState> _mapGetAuthState(
      GetAuthEvent event, PreferencesState state) async* {
    print('Getting Auth');
    bool? auth = await localStorageRepository.getAuth();

    yield state.copyWith(auth: auth);
  }

  Stream<PreferencesState> _mapAuthChangedState(
      AuthChangedEvent event, PreferencesState state) async* {
    print('Auth Changed');
    UserEntity currentUser = UserEntity.empty();

    await localStorageRepository.changeAuth(auth: event.auth!);
    if (!event.auth!) {
      print('x');
      await localStorageRepository.changeUser(user: currentUser);
      await localStorageRepository.changeOwnership(givenOwnership: '');
    }
    yield state.copyWith(auth: event.auth);
  }
}
