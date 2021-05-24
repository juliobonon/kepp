import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserText extends StatefulWidget {
  UserText(this.uid);
  final String uid;
  @override
  _UserTextState createState() => _UserTextState();
}

class _UserTextState extends State<UserText> {
  var name = "User";
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          name = snapshot.data['name'] != null ? snapshot.data['name'] : "User";
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name + " postou uma build",
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
