import 'package:flutter/material.dart';
import 'package:nightingale_v1/shared/constants.dart';
import 'package:nightingale_v1/models/user.dart';
import 'package:nightingale_v1/services/database.dart';
import 'package:provider/provider.dart';

class AddMedForm extends StatefulWidget {
  @override
  _AddMedFormState createState() => _AddMedFormState();
}

class _AddMedFormState extends State<AddMedForm> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentMedname;
  String _currentNotes;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Add a new Medicine',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration:
                textInputDecoration.copyWith(hintText: 'Medicine Name..'),
            validator: (val) => val.isEmpty ? 'Medicine Name: ' : null,
            onChanged: (val) => setState(() => _currentMedname = val),
          ),
          SizedBox(height: 40),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Notes..'),
            validator: (val) => val.isEmpty ? 'Add Notes: ' : null,
            onChanged: (val) => setState(() => _currentNotes = val),
          ),
          SizedBox(height: 20),
          RaisedButton(
              child: Text("Add"),
              color: Colors.white,
              textColor: Colors.teal,
              onPressed: () async {
                await DatabaseService(uid: user.uid)
                    .updateUserData(_currentMedname, _currentNotes);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
