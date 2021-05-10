import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kepp/models/keyboard.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future userName() async {
    final DocumentReference userName =
        FirebaseFirestore.instance.collection('users').doc(uid);

    return userName;
  }

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name) async {
    return await usersCollection.doc(uid).set({
      'name': name,
    });
  }

  Stream<List<KeyboardBuild>> getProducts() {
    return _db.collection('builds').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => KeyboardBuild.fromJson(doc.data()))
        .toList());
  }
}
