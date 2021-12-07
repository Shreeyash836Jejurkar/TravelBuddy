import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// List<String> selectedLocation = ["English", "Hindi"];

Widget dropDownMenu() {
  return DropdownButton<String>(
    hint: Text("Language"),
    items: <String>['English', 'Hindi'].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: (_) {},
  );
}
