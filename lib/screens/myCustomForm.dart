import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/allTextFieldWithMargin.dart';
import 'package:flutter_app/src/widgets/customRaisedButton.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Global key that uniquely identifies the Form widget
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
            fK: _formKey,
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
