import 'package:flutter/material.dart';

Widget allTextFieldWithMargin() {
  return Container(
    margin: new EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        new TextFormField(
          initialValue: 'Hello',
          decoration: new InputDecoration(hintText: 'Enter Something'),
          keyboardType: TextInputType.phone,
          validator: (value) {
            print(value);
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    ),
  );
}
