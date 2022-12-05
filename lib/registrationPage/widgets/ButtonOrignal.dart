
import 'package:flutter/material.dart';
class ButtonOrignal extends StatelessWidget {
  final String textHome;
  final VoidCallback onPressed;
  final Color textColor;
  final Color bgColor;

  const ButtonOrignal(
      {Key key,
        @required this.textHome,
        @required this.onPressed,
        @required this.textColor,
        @required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        color: bgColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),),
        child: Text(textHome,
          style: TextStyle(color: textColor, fontSize: 25),
        ),
      ),
    );
  }
}
