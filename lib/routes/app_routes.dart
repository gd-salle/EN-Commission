import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/landing_page.dart';

class AppRoutes {
  static const String loginPage = '/login';
  static const String registrationPage = '/register';
  static const String landingPage = '/';

  static final routes = <String, WidgetBuilder>{
    loginPage: (context) => LoginScreen(),
    registrationPage: (context) => RegistrationScreen(),
    landingPage: (context) => LandingPage(),
  };
}
