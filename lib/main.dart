import 'package:flutter/material.dart';
import 'package:stacked_login/app/locator.dart';
import 'package:stacked_login/services/authentication.dart';
import './models/user.dart';
import 'package:provider/provider.dart';
import './app/router.dart' as route;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.empty(),
      create: (context) => locator<Authentication>().userController.stream,
      child: MaterialApp(
        title: 'Stacked Login',
        initialRoute: '/login',
        onGenerateRoute: route.Router.generateRoute,
      ),
    );
  }
}
