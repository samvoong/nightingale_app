import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/user.dart';
import 'package:nightingale_v1/screens/authenticate/authenticate.dart';
import 'package:nightingale_v1/screens/home/home_page.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
    //return either home or Autenticate widget
  }
}