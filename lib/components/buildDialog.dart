import 'package:flutter/material.dart';
import 'package:kepp/models/keyboard.dart';

showBuildDialog(BuildContext context, KeyboardBuild build) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  Container content = Container(
    width: 200,
    height: 350,
    child: Column(
      children: [
        Text(
          build.name,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'imgs/pcb.png',
              width: 60,
            ),
            Text(build.pcb),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'imgs/switch.png',
              width: 60,
            ),
            Text(build.keyboardswitch),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'imgs/keycap.png',
              width: 50,
            ),
            SizedBox(width: 10),
            Text(build.keycap),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'imgs/case.png',
              width: 80,
            ),
            SizedBox(width: 10),
            Text(build.keyboardcase),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: okButton,
        ),
      ],
    ),
  );

  AlertDialog buildContainer = AlertDialog(
    content: content,
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return buildContainer;
    },
  );
}
