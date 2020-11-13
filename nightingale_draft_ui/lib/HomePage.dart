import 'package:flutter/material.dart';
import 'LoginPage.dart';

class HomePage extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 100,
            height: 50,
            margin: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/nightingale_logo.png')
                )
            ),
          ),
          SizedBox(height: 30,),
          Text("Welcome to Nightingale App", style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.w900
          ),textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          Text("Track you medication schedule with ease", style: TextStyle(
            fontSize: 18,
            color: Colors.teal,
            fontWeight: FontWeight.w400,
          ), textAlign: TextAlign.center,),
          SizedBox(height: 60,),
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: goBack,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                      color: Colors.white
                  ),
                  child: Text('go back...', style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent
                  ),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  void goBack()
  {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
}
