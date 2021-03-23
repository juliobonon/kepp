import 'package:flutter/material.dart';

class KeppButton extends StatelessWidget {
  const KeppButton({
    Key key,
    this.name,
    this.function,
  }) : super(key: key);

  final name;
  final function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(name, style: TextStyle(fontSize: 24, color: Colors.red)),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        side: BorderSide(
          color: Colors.red,
          width: 2,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
