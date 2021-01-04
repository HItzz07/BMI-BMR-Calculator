import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  CustomSnackBar({@required this.txt , @required this.key}) : super(key: key);
  final String txt;
  final Key key;


  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        'Please Select Your Activity Status and Gender',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.white60,
      elevation: 40,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    );
  }
}
