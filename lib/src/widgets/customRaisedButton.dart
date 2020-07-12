import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Text txt;
  final Text snackBar;
  final GlobalKey<FormState> formKey;
  final double width;
  final double height;
  final Color color;
  final Icon leadingIcon;
  final Icon finalIcon;
  final Function handle;

  const CustomRaisedButton(
      {Key key,
      @required this.txt,
      @required this.snackBar,
      @required this.formKey,
      @required this.width,
      @required this.height,
      @required this.color,
      this.leadingIcon,
      this.finalIcon,
      this.handle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, -2),
              blurRadius: height * .1,
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            leadingIcon ?? Container(),
            txt,
            finalIcon ?? Offstage(),
            RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: snackBar,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
