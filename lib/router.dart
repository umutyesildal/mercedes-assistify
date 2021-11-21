import 'package:flutter/material.dart';
import 'package:template/loginSignup/view/login.dart';
import 'package:template/loginSignup/view/signup.dart';
import 'package:template/loginSignup/view/widgets/widgets.dart';
import 'package:template/repairPage/repairPage.dart';
import 'package:template/repairPage/view/widgets/ongoingService.dart';

import 'mapPage/mapPage.dart';
import 'navigator/navigator.dart';
import 'settingsPage/settingsPage.dart';

class RouteGenerator {
  RouteGenerator._();

  static const landingRoute = '/';
  static const settingsRoute = '/SettingsRoute';
  static const repairRoute = '/RepairRoute';
  static const bookServiceRoute = '/BookServiceRoute';

  static const mapRoute = '/MapRoute';
  static const darkModeRoute = '/DarkModeRoute';
  static const languageRoute = '/LanguageRoute';
  static const loginRoute = '/Login';
  static const signUpRoute = '/SignUp';
  static const forgotPasswordRoute = '/ForgotPassword';
  static const onGoingServiceRoute = '/OngoingService';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingRoute:
        return MaterialPageRoute(builder: (context) => MainNavigator());

      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case onGoingServiceRoute:
        return MaterialPageRoute(builder: (context) => OngoingService());

      case repairRoute:
        return MaterialPageRoute(builder: (context) => RepairPage());

      case bookServiceRoute:
        return MaterialPageRoute(builder: (context) => BookService());
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (context) => ForgotPassword());

      case settingsRoute:
        return MaterialPageRoute(builder: (context) => SettingsMain());

      case mapRoute:
        return MaterialPageRoute(builder: (context) => MapPage());

      case darkModeRoute:
        return MaterialPageRoute(builder: (context) => ChangeTheme());

      case languageRoute:
        return MaterialPageRoute(builder: (context) => ChangeLanguage());

      case signUpRoute:
        return MaterialPageRoute(builder: (context) => SignUpPage());
      default:
        throw FormatException('Route not found');
    }
  }
}
