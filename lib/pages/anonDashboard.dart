import 'package:flutter/material.dart';
import 'package:kepp/components/anonDashboard.dart';
import 'package:kepp/providers/builds_provider.dart';
import 'package:provider/provider.dart';

class AnonDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final keyboardBuilds = Provider.of<BuildProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF2b343f),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 370,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.warning),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "You are currently using Kepp as Anonymous \n Please create an account or login to use all features",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.blueGrey[900]),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey),
                          child: Text(
                            "Go back",
                            style: (TextStyle(color: Colors.white)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AnonDashboardComponent(keyboardBuilds.products),
          ],
        ),
      ),
    );
  }
}
