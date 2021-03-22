import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import './login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _EmailTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      _PasswordTextField(),
                      _LoginButton(),
                    ],
                  ),
                ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

class _EmailTextField extends HookViewModelWidget<LoginViewModel> {
  const _EmailTextField({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    var _emailController = useTextEditingController();
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
      controller: _emailController,
      onChanged: model.updateEmail,
    );
  }
}

class _PasswordTextField extends HookViewModelWidget<LoginViewModel> {
  const _PasswordTextField({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    var _passwordController = useTextEditingController();
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
      controller: _passwordController,
      onChanged: model.updatePassword,
      obscureText: true,
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      builder: (context, model, child) {
        return RaisedButton(
          child: Text(
            'Login',
          ),
          onPressed: () async {
            bool loginSuccess = await model.login();
            if (loginSuccess) {
              Navigator.of(context).pushNamed('/');
            }
          },
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
