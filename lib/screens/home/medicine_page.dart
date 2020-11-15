import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/medicine.dart';
import 'package:nightingale_v1/screens/home/add_med_form.dart';
import 'package:nightingale_v1/screens/home/medicine_list.dart';
import 'package:nightingale_v1/services/auth.dart';
import 'package:nightingale_v1/services/database.dart';
import 'package:provider/provider.dart';

class MedicineScreen extends StatelessWidget {
  static const routeName = '/medicine';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.white,
          builder: (BuildContext bc) {
            return Wrap(children: <Widget>[
              Container(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: new BoxDecoration(
                        color: Colors.teal,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 40.0),
                      child: AddMedForm(),
                    )),
              )
            ]);
          });

      // showModalBottomSheet<dynamic>(
      //     context: context,
      //     builder: (context) {
      //       return Container(
      //         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      //         child: AddMedForm(),
      //       );
      //     });
    }

    return StreamProvider<List<Medicine>>.value(
      value: DatabaseService().medicines,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              textColor: Colors.white,
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              label: Text('Add'),
              textColor: Colors.white,
              icon: Icon(Icons.add_alarm),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: MedicineList(),
      ),
    );
  }
}
