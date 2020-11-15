import 'package:flutter/material.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ubuntu',
      ),
      home: DoctorScreen(),
    );
  }
}

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact your Doctor',
        ),
        backgroundColor: Colors.teal,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          // Container(
          //   width: 150,
          //   height: 150,
          //   margin: EdgeInsets.only(top: 0),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/nightingale_logo.png'),
          //           fit: BoxFit.contain
          //       )
          //   ),
          // ),
          SizedBox(height: 200),
          Text("Contact your Doctor", style: TextStyle(
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
                    image: AssetImage('assets/images/doctor.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center
                )
            ),
          ),
          SizedBox(height: 20,),
          Text("Get quick advice for your prescriptions", style: TextStyle(
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