import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kepp/models/keyboard.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<KeyboardBuild>> getProducts() {
    return _db.collection('builds').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => KeyboardBuild.fromJson(doc.data()))
        .toList());
  }
}
