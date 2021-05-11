import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kepp/components/alertDialog.dart';
import 'package:kepp/components/keppButton.dart';
import 'package:kepp/services/auth.dart';
import 'package:kepp/services/database.dart';
import 'package:provider/provider.dart';

class CreateBuild extends StatefulWidget {
  @override
  _CreateBuildState createState() => _CreateBuildState();
}

class _CreateBuildState extends State<CreateBuild> {
  TextEditingController buildName = TextEditingController();
  String pcbName = '';
  String switchName = '';
  String keycapName = '';
  String caseName = '';
  List<String> pcbList = ['', 'DZ60RGB-ANSI V2', 'DZ60 V3 60%'];
  List<String> switchList = ['', 'Cherry', 'Gateron', 'Outemu'];
  List<String> keycapList = ['', 'OEM', 'G-ABS', 'G-PBT'];
  List<String> caseList = ['', '60% Silver CNC', '60% Plastic KB'];

  void publishBuild() {
    try {
      FirebaseFirestore.instance.collection('builds').add(
        {
          'name': buildName.text,
          'PCB': pcbName.toString(),
          'switch': switchName.toString(),
          'keycap': keycapName.toString(),
        },
      );
      showAlertDialog(
          context, 'Sua build foi criada com sucesso: ' + buildName.text);
    } catch (e) {
      showAlertDialog(context, 'Problema em criar a build');
    }
  }

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
                    child: TextFormField(
                      controller: buildName,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PCB',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(width: 50),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: pcbName,
                                items: pcbList
                                    .map((String code) =>
                                        new DropdownMenuItem<String>(
                                            value: code,
                                            child: new Text(
                                              code,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))
                                    .toList(),
                                onChanged: (newvalue) => setState(() {
                                  pcbName = newvalue;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Switch',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(width: 50),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: switchName,
                                items: switchList
                                    .map((String code) =>
                                        new DropdownMenuItem<String>(
                                            value: code,
                                            child: new Text(
                                              code,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))
                                    .toList(),
                                onChanged: (newvalue) => setState(() {
                                  switchName = newvalue;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Keycap',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(width: 50),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: keycapName,
                                items: keycapList
                                    .map((String code) =>
                                        new DropdownMenuItem<String>(
                                            value: code,
                                            child: new Text(
                                              code,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))
                                    .toList(),
                                onChanged: (newvalue) => setState(() {
                                  keycapName = newvalue;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Case',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(width: 50),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: caseName,
                                items: caseList
                                    .map((String code) =>
                                        new DropdownMenuItem<String>(
                                            value: code,
                                            child: new Text(
                                              code,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))
                                    .toList(),
                                onChanged: (newvalue) => setState(() {
                                  caseName = newvalue;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  KeppButton(
                    name: 'PUBLISH',
                    onpressed: publishBuild,
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
