import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          allTextFieldWithMargin(),
          paddingRaisedButton(_formKey, context),
        ],
      ),
    );
  }
}

Widget allTextFieldWithMargin() {
  return Container(
    margin: new EdgeInsets.all(16.0),
    child: Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Enter Something'),
          keyboardType: TextInputType.phone,
          validator: (value) {
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

Widget paddingRaisedButton(fk, layout) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: RaisedButton(
      onPressed: () {
        if (fk.currentState.validate()) {
          Scaffold.of(layout).showSnackBar(
            SnackBar(
              content: Text('Processing Data'),
            ),
          );
        }
      },
      child: Text('Submit'),
    ),
  );
}
