import 'package:flutter/material.dart';
import 'package:nightingale_v1/screens/authenticate/sign_in_page.dart';
import 'package:nightingale_v1/screens/medicine/medicine_page.dart';
import 'package:nightingale_v1/screens/schedule/scheduling_page.dart';
import 'package:nightingale_v1/screens/doctor/doctor_page.dart';
import '../authenticate/sign_in_page.dart';
import 'package:nightingale_v1/services/auth.dart';
import 'package:alan_voice/alan_voice.dart';


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
  final AuthService _auth = AuthService();


void _navigateTo(String screen) {
	switch (screen) {
		case "Home":
			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => HomePage()),
			);
			break;
		case "Medicine":
			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => MedicinePage()),
			);
			break;
    case "Schedule":
			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => SchedulingPage()),
			);
			break;
      	case "Doctor":
			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => DoctorPage()),
			);
			break;
		default:
			print("Unknown screen: $screen");
	}
}

void _handleCommand(Map<String, dynamic> command) {
	switch (command["command"]) {
		case "navigation":
			_navigateTo(command["route"]);
			break;
		default:
			debugPrint("Unknown command: ${command}");
	}
}

  _MyHomePageState() {
    //Init Alan with sample project id
    AlanVoice.addButton(
        "5b42ec32b29e02864b0ddbc2a565aec92e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    //Add listener for command event
		AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  }


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
            textColor: Colors.white,
            // onPressed: () async {
            //   await _auth.signOut();
            //   Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => LoginScreen(),
            //       ),
            //   );
            // },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/nightingale_logo.png'),
                    fit: BoxFit.contain
                )
            ),
          ),
          SizedBox(height: 50),
          Text("Welcome to the Nightingale App", style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w900
          ),textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/drug.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center
                )
            ),
          ),
          SizedBox(height: 20,),
          Text("Track you medication schedule with ease", style: TextStyle(
            fontSize: 15,
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
}
