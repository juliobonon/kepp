import 'package:flutter/material.dart';

class ComponentDropdown extends StatefulWidget {
  ComponentDropdown({
    this.componentName,
    this.componentList,
    this.selectedValue,
  });

  final String componentName;
  final List<String> componentList;
  String selectedValue;

  @override
  _ComponentDropdownState createState() => _ComponentDropdownState();
}

class _ComponentDropdownState extends State<ComponentDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 280,
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.componentName,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(width: 50),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.selectedValue,
                items: widget.componentList
                    .map((String code) => new DropdownMenuItem<String>(
                        value: code,
                        child: new Text(
                          code,
                          style: TextStyle(color: Colors.white),
                        )))
                    .toList(),
                onChanged: (code) => setState(
                  () {
                    widget.selectedValue = code;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
