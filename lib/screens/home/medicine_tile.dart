import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/medicine.dart';

class MedicineTile extends StatelessWidget {

  final Medicine medicine;
  MedicineTile({this.medicine});  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          title: Text(medicine.medName),
          subtitle: Text('Note: ${medicine.notes}'),

        ),
      ),
    );
  }
}