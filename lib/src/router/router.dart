import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'route_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    // case entryPointScreenRoute:
    //   return MaterialPageRoute(builder: (context) => const EntryPoint());

    default:
      return MaterialPageRoute(
          // Make a screen for undefine
          builder: (context) => const SplashView());
  }
}
