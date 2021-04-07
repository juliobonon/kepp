import 'package:flutter/material.dart';

class ComponentDropdown extends StatelessWidget {
  ComponentDropdown(
      {this.componentName, this.componentList, this.selectedValue});

  final String componentName;
  final List<String> componentList;
  final String selectedValue;

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
              componentName,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(width: 50),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                items: componentList
                    .map((String code) => new DropdownMenuItem<String>(
                        value: code,
                        child: new Text(
                          code,
                          style: TextStyle(color: Colors.white),
                        )))
                    .toList(),
                onChanged: (code) => selectedValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
