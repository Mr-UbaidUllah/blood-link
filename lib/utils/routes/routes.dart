


import 'package:blood_link/utils/routes/routes_names.dart';
import 'package:blood_link/view/home_screen.dart';
import 'package:blood_link/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {

  static MaterialPageRoute generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());

      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No route found"),),
          );
        });
    }
  }
}