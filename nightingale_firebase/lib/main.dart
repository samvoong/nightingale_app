import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/user.dart';
import 'package:nightingale_v1/screens/wrapper.dart';
import 'package:nightingale_v1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:nightingale_v1/screens/authenticate/sign_in.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Nightingale App',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primaryColor: Colors.teal,
          accentColor: Colors.black,
          cursorColor: Colors.blueGrey,
          // fontFamily: 'SourceSansPro',
          textTheme: TextTheme(
            button: TextStyle(
              fontFamily: 'OpenSans',
            ),
            caption: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent,
            ),
          ),
        ),
        home: LoginScreen(),
        // navigatorObservers: [TransitionRouteObserver()],
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          // DashboardScreen.routeName: (context) => DashboardScreen(),
        },
      ));
  }
}
