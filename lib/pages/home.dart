import 'package:flutter/material.dart';
import 'package:kepp/services/auth.dart';

class Home extends StatefulWidget {
  Home({this.auth, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: _signOut),
        ],
      ),
      body: Center(child: Text("Estou logado e muito feliz.")),
    );
  }
}
