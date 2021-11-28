import 'package:car_repository/template_repository.dart';
import 'package:service_repository/template_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_storage/local_storage.dart';
import 'constants.dart';
import 'landingPage/landingPage.dart';
import 'loginSignup/bloc/auth_bloc.dart';
import 'mainBloc/main_bloc.dart';
import 'router.dart';
import 'service_locator.dart';

class App extends StatelessWidget { 
  const App();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sl.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider(
              create: (context) =>
                  AuthBloc(localStorageRepository: sl.get<LocalStorage>()),
              child: BlocProvider(
                create: (context) =>
                    MainBloc(localStorageRepository: sl.get<LocalStorage>(),
                    carRepository: sl.get<CarRepository>(),
                    serviceRepository: sl.get<ServiceRepository>()),
                child: BlocProvider(
                  create: (context) => LandingBloc(
                      localStorageRepository: sl.get<LocalStorage>()),
                  child: MyApp(),
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
    BlocProvider.of<MainBloc>(context).add(GetThemeEvent());
    BlocProvider.of<MainBloc>(context).add(GetLocaleEvent());
    BlocProvider.of<MainBloc>(context).add(GetAuthEvent());
    BlocProvider.of<MainBloc>(context).add(GetCarEvent());
    BlocProvider.of<MainBloc>(context).add(GetServiceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
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
