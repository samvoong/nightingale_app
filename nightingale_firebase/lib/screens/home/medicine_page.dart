import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/medicine.dart';
import 'package:nightingale_v1/screens/home/medicine_list.dart';
import 'package:nightingale_v1/services/auth.dart';
import 'package:nightingale_v1/services/database.dart';
import 'package:provider/provider.dart';

class MedicineScreen extends StatelessWidget {
  static const routeName = '/medicine';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Medicine>>.value(
      value: DatabaseService().medicines,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Nightingale Prototype'),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.brown[400],
        //   elevation: 0.0,
        //   actions: <Widget>[
        //     FlatButton.icon(
        //       icon: Icon(Icons.person),
        //       label: Text('logout'),
        //       onPressed: () async {
        //         await _auth.signOut();
        //       },
        //     )
        //   ],
        // ),
        body: MedicineList(),
      ),
    );

  }
}