import 'dart:async';
import 'package:car_repository/template_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:meta/meta.dart';
import 'package:service_repository/template_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(
      {required this.localStorageRepository,
      required this.carRepository,
      required this.serviceRepository})
      : super(MainInitial());

  final LocalStorage localStorageRepository;
  final CarRepository carRepository;
  final ServiceRepository serviceRepository;

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
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
    } else if (event is GetCarEvent) {
      yield* _mapGetCarState(event, state);
    } else if (event is GetServiceEvent) {
      yield* _mapSetServiceState(event, state);
    }
  }

  Stream<MainState> _mapThemeChangedState(
      ThemeChangedEvent event, MainState state) async* {
    print('Theme Changed');
    await localStorageRepository.changeTheme(theme: event.theme);

    yield state.copywith(darkMode: event.theme);
  }

  Stream<MainState> _mapGetThemeState(
      GetThemeEvent event, MainState state) async* {
    print('Getting Theme');
    bool? darkMode = await localStorageRepository.getTheme();

    yield state.copywith(darkMode: darkMode, isTheme: true);
  }

  Stream<MainState> _mapGetLocaleState(
      GetLocaleEvent event, MainState state) async* {
    print('Getting Locale');
    String? locale = await localStorageRepository.getLocale();

    yield state.copywith(locale: locale);
  }

  Stream<MainState> _mapLocaleChangedState(
      LocaleChangedEvent event, MainState state) async* {
    print('Locale Changed');
    await localStorageRepository.changeLocale(locale: event.locale!);
    yield state.copywith(locale: event.locale);
  }

  Stream<MainState> _mapGetAuthState(
      GetAuthEvent event, MainState state) async* {
    print('Getting Auth');
    bool? auth = await localStorageRepository.getAuth();

    yield state.copywith(auth: auth);
  }

  Stream<MainState> _mapAuthChangedState(
      AuthChangedEvent event, MainState state) async* {
    print('Auth Changed');
    await localStorageRepository.changeAuth(auth: event.auth!);
    yield state.copywith(auth: event.auth);
  }

  Stream<MainState> _mapGetCarState(GetCarEvent event, MainState state) async* {
    CarEntity? car1 = CarEntity.empty();
    yield state.copywith(currentCar: car1);

    CarEntity? car = await carRepository.getCar();
    print(car.beygir);
    yield state.copywith(currentCar: car);
  }
  
  Stream<MainState> _mapSetServiceState(
      GetServiceEvent event, MainState state) async* {
    print('Get Service');
    ServiceEntity service = new ServiceEntity(
        gelis_tarihi: "gelis_tarihi",
        teslim_tarihi: "teslim_tarihi",
        ownership: "ownership",
        bakim_asamasi: "bakim_asamasi",
        maintenance: ["maintenance"]);
    await serviceRepository.setService(service);
  }
}
