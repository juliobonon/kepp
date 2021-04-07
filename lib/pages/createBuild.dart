import 'package:flutter/material.dart';
import 'package:kepp/components/componentDropdown.dart';
import 'package:kepp/components/keppButton.dart';
import 'package:kepp/services/auth.dart';
import 'package:provider/provider.dart';

class CreateBuild extends StatefulWidget {
  @override
  _CreateBuildState createState() => _CreateBuildState();
}

class _CreateBuildState extends State<CreateBuild> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
              child: Column(
                children: [
                  Text(
                    'Create your Build!',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Name your new build',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF718296)),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(),
                  ),
                  SizedBox(height: 20),
                  ComponentDropdown(
                    componentName: 'PCB',
                    componentList: ['Cherry', 'Gateron', 'Outemu', 'Pandas'],
                  ),
                  SizedBox(height: 20),
                  ComponentDropdown(
                    componentName: 'Switch',
                    componentList: ['Cherry', 'Gateron', 'Outemu', 'Pandas'],
                  ),
                  SizedBox(height: 20),
                  ComponentDropdown(
                    componentName: 'Keycap',
                    componentList: ['Cherry', 'Gateron', 'Outemu', 'Pandas'],
                  ),
                  SizedBox(height: 20),
                  ComponentDropdown(
                    componentName: 'Case',
                    componentList: ['Cherry', 'Gateron', 'Outemu', 'Pandas'],
                  ),
                  SizedBox(height: 20),
                  KeppButton(
                    name: 'PUBLISH',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
