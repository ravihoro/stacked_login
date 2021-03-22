import 'package:stacked/stacked.dart';
import '../../../app/locator.dart';
import '../../../services/authentication.dart';

class LoginViewModel extends BaseViewModel {
  String _email;
  String _password;

  final authentication = locator<Authentication>();

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> login() async {
    bool val = await authentication.login(_email, _password);
    return val;
  }
}
