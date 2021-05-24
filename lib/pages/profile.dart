import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kepp/services/auth.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var uid = FirebaseAuth.instance.currentUser.uid;

  Stream<QuerySnapshot> getSavedBuilds(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('builds')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'imgs/logo.png',
              width: 150,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    context.read<Auth>().signOut();
                  },
                )
              ],
            )
          ],
        ),
        CircleAvatar(
          minRadius: 50,
          child: Image(
            width: 200,
            image: AssetImage('imgs/avatar.png'),
          ),
        ),
        SizedBox(height: 20),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Text(
                snapshot.data['name'],
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              );
            }
            return CircularProgressIndicator();
          },
        ),
        SizedBox(height: 20),
        ProfileBox(
          title: "Minhas builds",
          text: "Visualize sua lista de builds criadas em apenas um clique.",
          onPressed: () {},
        ),
        SizedBox(height: 10),
        ProfileBox(
          title: "Builds salvas",
          text: "Visualize sua lista de builds salvas em apenas um clique.",
          onPressed: () {},
        ),
      ],
    );
  }
}

class ProfileBox extends StatelessWidget {
  const ProfileBox({Key key, this.text, this.title, this.onPressed})
      : super(key: key);

  final String title;
  final String text;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 135,
      decoration: BoxDecoration(
        color: Color(0xff324152),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(text),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: onPressed,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
