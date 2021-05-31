import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kepp/components/buildDialog.dart';
import 'package:kepp/components/userText.dart';
import 'package:kepp/models/keyboard.dart';
import 'package:kepp/providers/builds_provider.dart';
import 'package:provider/provider.dart';

class SavedBuilds extends StatefulWidget {
  @override
  _SavedBuildsState createState() => _SavedBuildsState();
}

class _SavedBuildsState extends State<SavedBuilds> {
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
                  'Builds Salvas',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SavedBuildsDashboard(keyboardBuilds.products),
          ],
        ),
      ),
    );
  }
}

class SavedBuildsDashboard extends StatefulWidget {
  SavedBuildsDashboard(this.keyboardStream);
  final Stream<List<KeyboardBuild>> keyboardStream;
  @override
  _SavedBuildsDashboardState createState() => _SavedBuildsDashboardState();
}

class _SavedBuildsDashboardState extends State<SavedBuildsDashboard> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var uid = FirebaseAuth.instance.currentUser.uid;

  Future<void> saveBuild(String uid, KeyboardBuild build) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<KeyboardBuild>>(
        stream: widget.keyboardStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              itemCount: snapshot?.data?.length ?? 0,
              itemBuilder: (context, index) {
                if (snapshot.data[index].favorites.contains(uid)) {
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
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.save),
                                    onPressed: () {
                                      if (snapshot.data[index].favorites
                                          .contains(uid)) {
                                        snapshot.data[index].favorites
                                            .remove(uid);
                                      } else {
                                        snapshot.data[index].favorites.add(uid);
                                      }
                                      FirebaseFirestore.instance
                                          .collection("builds")
                                          .doc(snapshot.data[index].id)
                                          .update(snapshot.data[index].toMap());
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                    onPressed: () {
                                      showBuildDialog(
                                          context, snapshot.data[index]);
                                    },
                                  ),
                                ],
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
