import 'package:flutter/material.dart';
import 'package:kepp/components/keppButton.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b343f),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('imgs/logo.png'),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What is Kepp?",
                      style: TextStyle(color: Colors.red, fontSize: 32.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Kepp is an application with the goal of bringing together all mechanical keyboard enthusiasts and making the community stronger by sharing custom builds.",
                    style: TextStyle(
                      color: Color(0xFF718296),
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            KeppButton(
              name: 'Get Started',
              onpressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
