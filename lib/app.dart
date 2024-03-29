import 'package:car_repository/template_repository.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:ownership_repository/ownership_repository.dart';
import 'package:service_repository/template_repository.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_storage/local_storage.dart';
import 'package:template/carPage/carPage.dart';
import 'package:template/preferencesBloc/preferences_bloc.dart';
import 'constants.dart';
import 'loginSignup/bloc/auth_bloc.dart';
import 'repairPage/bloc/bloc/service_bloc.dart';
import 'router.dart';
import 'service_locator.dart';
import 'settingsPage/bloc/settings_bloc.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sl.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider(
              create: (context) => AuthBloc(
                  localStorageRepository: sl.get<LocalStorage>(),
                  userRepository: sl.get<UserRepository>()),
              child: BlocProvider(
                create: (context) => PreferencesBloc(
                    localStorageRepository: sl.get<LocalStorage>(),
                    carRepository: sl.get<CarRepository>(),
                    serviceRepository: sl.get<ServiceRepository>()),
                child: BlocProvider(
                  lazy: false,
                  create: (context) => CarBloc(
                      localStorageRepository: sl.get<LocalStorage>(),
                      carRepository: sl.get<CarRepository>(),
                      ownershipRepository: sl.get<OwnershipRepository>(),
                      userRepository: sl.get<UserRepository>()),
                  child: BlocProvider(
                    lazy: false,
                    create: (context) => SettingsBloc(
                      localStorageRepository: sl.get<LocalStorage>(),
                    ),
                    child: BlocProvider(
                      lazy: false,
                      create: (context) => ServiceBloc(
                        localStorage: sl.get<LocalStorage>(),
                        serviceRepository: sl.get<ServiceRepository>(),
                        maintenanceRepository: sl.get<MaintenanceRepository>(),
                        carBloc: BlocProvider.of<CarBloc>(context),
                        ownershipRepository: sl.get<OwnershipRepository>(),
                      ),
                      child: MyApp(),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getNecessities();
  }

  Future? getNecessities() async {
    BlocProvider.of<PreferencesBloc>(context).add(GetThemeEvent());
    BlocProvider.of<PreferencesBloc>(context).add(GetLocaleEvent());
    BlocProvider.of<PreferencesBloc>(context).add(GetAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state.isTheme == false) {
          return SizedBox();
        } else {
          return MaterialApp(
              title: '',
              theme: getThemeData(state.darkMode!),
              locale: Locale(state.locale!),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              initialRoute: state.auth!
                  ? RouteGenerator.landingRoute
                  : RouteGenerator.loginRoute,
              onGenerateRoute: (settings) {
                return RouteGenerator.generateRoute(settings);
              });
        }
      },
    );
  }
}

ThemeData getThemeData(bool theme) {
  if (theme == false) {
    print('returning light Theme');

    return lightTheme;
  } else if (theme == true) {
    print('returning dark Theme');

    return darkTheme;
  } else {
    print('returning light else Theme');

    return lightTheme;
  }
}
