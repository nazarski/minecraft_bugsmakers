import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minecraft_bugsmakers/models/mod_model.dart';
import 'package:minecraft_bugsmakers/pages/home_page/home_page.dart';
import 'package:minecraft_bugsmakers/pages/mod_page/mod_page.dart';
import 'package:minecraft_bugsmakers/pages/splash_screen/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    log('⤴️ ${settings.name}');
    switch (settings.name) {
      case SplashScreen.routeName:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
        );
      case HomePage.routeName:
        return PageTransition(
          child: HomePage(),
          type: PageTransitionType.fade,
        );
      case ModPage.routeName:
        return PageTransition(
          child: ModPage(
            mod: arguments as ModModel,
          ),
          type: PageTransitionType.rightToLeft,
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
