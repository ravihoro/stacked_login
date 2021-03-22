import '../models/user.dart';
import 'dart:async';

class Authentication {
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String email, String password) async {
    if (email != '' && password != '') {
      await Future.delayed(Duration(seconds: 2));
      userController.add(User(name: 'Ravi', email: 'ravi@gmail.com'));
      return true;
    } else {
      await Future.delayed(Duration(seconds: 2));
      return false;
    }
  }
}
