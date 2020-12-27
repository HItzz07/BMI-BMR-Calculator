import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/results_page.dart';
import 'package:bmicalc/screens/input_page.dart';

class NormButton extends StatelessWidget {
  final String buttonTitle = '';
  final Function onPress;
  NormButton({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
