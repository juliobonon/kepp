import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox(
      {Key key,
      this.name,
      this.obscureText,
      this.controller,
      this.validator,
      this.hintText})
      : super(key: key);

  final name;
  final obscureText;
  final controller;
  final validator;
  final hintText;

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
          hintText: hintText,
          labelText: name,
          focusColor: Color(0xFFef492f),
          labelStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFF556678),
          ),
        ),
        obscureText: obscureText,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
