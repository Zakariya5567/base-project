import 'package:flutter_base_project/view/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter_base_project/view/screens/connection_screen/connection_error_screen.dart';
import 'package:flutter_base_project/view/screens/splash_screen/splash_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const logInScreen = "/logInScreen";
  static const homeScreen = "/homeScreen";

  static const noConnectionScreen = "/noConnectionScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    noConnectionScreen: (context) => const NoConnection(),
    logInScreen: (context) => const LoginScreen(),
    homeScreen: (context) => const HomeScreen(),
  };
}
