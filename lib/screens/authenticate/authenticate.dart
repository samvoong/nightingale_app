import 'package:flutter/material.dart';
import 'package:nightingale_v1/screens/authenticate/register.dart';
import 'package:nightingale_v1/screens/authenticate/sign_in_page.dart';

import 'sign_in_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return LoginScreen();
      // } else {
      //   return Register(toggleView: toggleView);
      // }
    }
  }
}