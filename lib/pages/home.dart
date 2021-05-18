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
                      width: 80,
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
          Expanded(
            child: StreamBuilder<List<KeyboardBuild>>(
              stream: keyboardBuilds.products,
              builder: (context, snapshot) {
                if (keyboardBuilds != null) {
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    itemCount: snapshot.data.length,
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
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "User publicou uma nova build",
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                ),
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
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
