import 'package:flutter/material.dart';
import '../../../models/user.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${Provider.of<User>(context).name}'),
            RaisedButton(
              child: Text("Logout"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
