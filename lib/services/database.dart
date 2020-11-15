import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:nightingale_v1/models/brew.dart';
import 'package:nightingale_v1/models/medicine.dart';
import 'package:nightingale_v1/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference medicineCollection =
      Firestore.instance.collection('medicines');

  Future updateUserData(String medName, String notes) async {
    return await medicineCollection.document(uid).setData({
      'medName': medName,
      'notes': notes,
    });
  }

  List<Medicine> _medicineListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Medicine(
          medName: doc.data['medName'] ?? '', notes: doc.data['notes'] ?? '');
    }).toList();
  }

  Stream<List<Medicine>> get medicines {
    return medicineCollection.snapshots().map(_medicineListFromSnapshot);
  }

  //create user data from the snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        medName: snapshot.data['name'],
        notes: snapshot.data['notes']);
  }

  //get the medicice stream from firebase
  Stream<UserData> get userData {
    return medicineCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
