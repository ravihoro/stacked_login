import 'package:flutter/material.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';

abstract class Routes {
  static const loginViewRoute = '/login';
  static const homeViewRoute = '/';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                      'No route defined for ${settings.name}',
                    ),
                  ),
                ));
    }
  }
}
