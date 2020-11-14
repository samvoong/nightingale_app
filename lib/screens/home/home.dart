import 'package:flutter/material.dart';
import 'package:nightingale_v1/screens/authenticate/sign_in.dart';
import 'package:nightingale_v1/screens/home/medicine_page.dart';
import '../authenticate/sign_in.dart';
import 'package:nightingale_v1/services/auth.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ubuntu',
      ),
      home: MyHomePage(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 40,
            margin: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/nightingale_logo.png'),
                    fit: BoxFit.contain
                )
            ),
          ),
          SizedBox(height: 30,),
          Text("Welcome to the Nightingale App", style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.w900
          ),textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/drug.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center
                )
            ),
          ),
          SizedBox(height: 30,),
          Text("Track you medication schedule with ease", style: TextStyle(
            fontSize: 20,
            color: Colors.teal,
            fontWeight: FontWeight.w400,
          ), textAlign: TextAlign.center,),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
  void logOut()
  {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
}
