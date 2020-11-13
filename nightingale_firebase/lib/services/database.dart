import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:nightingale_v1/models/brew.dart';
import 'package:nightingale_v1/models/medicine.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // //collection reference
  // final CollectionReference brewCollection = Firestore.instance.collection('brews');

  // Future updateUserData(String sugars, String name, int strength) async {
  //   return await brewCollection.document(uid).setData({
  //     'sugars': sugars,
  //     'name': name,
  //     'strength': strength,
  //   });
  // }

  // // brewlist from a snapshot

  // List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Brew(
  //       name: doc.data['name'] ?? '',
  //       strengh: doc.data['strength'] ?? 0,
  //       sugars: doc.data['sugars'] ?? '0'
  //     );
  //   }).toList();
  // }

  // //get {brew} stream
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots()
  //     .map(_brewListFromSnapshot);
  // }


  //setup for the Med

  final CollectionReference medicineCollection = Firestore.instance.collection('medicines');

  Future updateUserData(String medName, String notes) async {
    return await medicineCollection.document(uid).setData({
      'medName': medName,
      'notes': notes,
    });
  }

  List<Medicine> _medicineListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Medicine(
        medName: doc.data['medName'] ?? '',
        notes: doc.data['notes'] ?? ''

      );
    }).toList();
  }

  Stream<List<Medicine>> get medicines {
    return medicineCollection.snapshots()
      .map(_medicineListFromSnapshot);
  }



}