import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kepp/components/buildDialog.dart';
import 'package:kepp/components/userText.dart';
import 'package:kepp/models/keyboard.dart';
import 'package:kepp/providers/builds_provider.dart';
import 'package:provider/provider.dart';

class MyBuilds extends StatefulWidget {
  @override
  _MyBuildsState createState() => _MyBuildsState();
}

class _MyBuildsState extends State<MyBuilds> {
  @override
  Widget build(BuildContext context) {
    final keyboardBuilds = Provider.of<BuildProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Minhas Builds',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            DashBoard(keyboardBuilds.products),
          ],
        ),
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  DashBoard(this.keyboardStream);
  final Stream<List<KeyboardBuild>> keyboardStream;
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<KeyboardBuild>>(
        stream: widget.keyboardStream,
        builder: (context, snapshot) {
          if (snapshot == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              itemCount: snapshot?.data?.length ?? 0,
              itemBuilder: (context, index) {
                if (snapshot.data[index].userUid == uid) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xff324152),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            UserText(snapshot.data[index].userUid),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Text('Nome: ' +
                                      snapshot.data[index].name.toString()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  showBuildDialog(
                                      context, snapshot.data[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            );
          }
        },
      ),
    );
  }
}
