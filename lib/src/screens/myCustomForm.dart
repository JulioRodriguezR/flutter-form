import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/customRaisedButton.dart';

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
        children: <Widget>[
          allTextFieldWithMargin(),
          CustomRaisedButton(
            txt: Text('submit'),
            snackBar: Text('Processing Data'),
            formKey: _formKey,
            width: 150,
            height: 40,
            color: Colors.grey,
            handle: () => {print('clicked on submit button')},
          )
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
