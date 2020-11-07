import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}