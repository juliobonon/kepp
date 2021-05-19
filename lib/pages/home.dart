import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kepp/components/buildDialog.dart';
import 'package:kepp/models/keyboard.dart';
import 'package:kepp/providers/builds_provider.dart';
import 'package:kepp/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final keyboardBuilds = Provider.of<BuildProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'imgs/logo.png',
                width: 150,
              ),
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 20,
                    child: Image(
                      width: 50,
                      image: AssetImage('imgs/avatar.png'),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'User',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
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
              )
            ],
          ),
          DashBoard(keyboardBuilds.products),
        ],
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
                                  onPressed: () {},
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
              },
            );
          }
        },
      ),
    );
  }
}

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
