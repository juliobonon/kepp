import 'package:flutter/material.dart';
import 'package:kepp/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({this.auth, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome, User!',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recently Added',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
