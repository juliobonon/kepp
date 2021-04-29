import 'package:flutter/material.dart';

class KeppButton extends StatelessWidget {
  const KeppButton({
    Key key,
    this.name,
    this.onpressed,
  }) : super(key: key);

  final name;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(name, style: TextStyle(fontSize: 24, color: Colors.red)),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
          color: Colors.red,
          width: 2,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
