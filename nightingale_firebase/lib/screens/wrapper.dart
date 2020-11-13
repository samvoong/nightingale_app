import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/user.dart';
import 'package:nightingale_v1/screens/authenticate/authenticate.dart';
import 'package:nightingale_v1/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    //return either home or Autenticate widget
  }
}