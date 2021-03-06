import 'package:flutter/material.dart';
import 'package:kepp/pages/anonDashboard.dart';
import 'package:kepp/pages/initial.dart';
import 'package:kepp/pages/myBuilds.dart';
import 'package:kepp/pages/savedBuilds.dart';
import 'package:kepp/wrapper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthWrapper());
      case '/initialRoute':
        return MaterialPageRoute(
          builder: (_) => InitialPage(),
        );
      case '/anon':
        return MaterialPageRoute(
          builder: (_) => AnonDashboard(),
        );
      case '/myBuilds':
        return MaterialPageRoute(
          builder: (_) => MyBuilds(),
        );
      case '/savedBuilds':
        return MaterialPageRoute(
          builder: (_) => SavedBuilds(),
        );

      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
