import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3743),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'imgs/garra.png',
                  width: 190,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'imgs/logo.png',
                  width: 290,
                ),
              ),
            ],
          ),
          Input(name: "User", obscureText: false),
          Input(name: "Password", obscureText: true),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("LOGIN",
                    style: TextStyle(fontSize: 24, color: Colors.red)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  side: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
              ),
              SizedBox(width: 25),
              Text(
                "Or",
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
              SizedBox(width: 25),
              TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.red, fontSize: 24),
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key key,
    this.name,
    this.obscureText,
    this.controller,
  }) : super(key: key);

  final name;
  final obscureText;
  final controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        cursorColor: Color(0xFFef492f),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFef492f)),
          ),
          labelText: name,
          focusColor: Color(0xFFef492f),
          labelStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF556678),
          ),
        ),
        obscureText: obscureText,
        controller: controller,
      ),
    );
  }
}
