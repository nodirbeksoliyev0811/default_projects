import 'package:example_app/ui/splash/splash_screen.dart';
import 'package:example_app/ui/tabs/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String splashScreen = "/home";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
