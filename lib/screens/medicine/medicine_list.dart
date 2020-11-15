import 'package:flutter/material.dart';
import 'package:nightingale_v1/models/medicine.dart';
import 'package:nightingale_v1/screens/medicine/medicine_tile.dart';
import 'package:provider/provider.dart';

class MedicineList extends StatefulWidget {
  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    final medicines = Provider.of<List<Medicine>>(context) ?? [];

    // medicines.forEach((medicine) {
    //   print(medicine.medName);
    //   print(medicine.notes);
    // });
    // medicines.forEach((medicine) {
    //   print(medicine.medName);
    //   print(medicine.notes);
    // });

    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return MedicineTile(medicine: medicines[index]);
      },
    );
  }
}