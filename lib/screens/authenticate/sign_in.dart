import 'package:flutter/material.dart';
import 'package:nightingale_v1/services/auth.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:nightingale_v1/screens/home/router.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final AuthService _auth =  AuthService();

  //text field state
  String email = '';
  String password = '';
  String error = '';


  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      dynamic result = _auth.signInWithEmailAndPassword(email, password);
      if(result == null){
        return 'Please use a valid email or password';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: 'Nightingale',
      logo: 'assets/images/nightingale_logo.png',
      logoTag: 'Logo Tag',
      titleTag: 'Title Tag',
      emailValidator: (value) {
        if (!value.contains('@') && !value.endsWith('.com')) {
          return "Enter an email";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Enter a password';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => RouterScreen(),
        ));
      },
      showDebugButtons: false,
    );
  }
}
