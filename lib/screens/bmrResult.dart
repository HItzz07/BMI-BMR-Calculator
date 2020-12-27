import 'package:bmicalc/constants.dart';
import 'package:bmicalc/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class BMRResultsPage extends StatelessWidget {

  BMRResultsPage({@required this.bmrResult,@required this.resultText,@required this.interpretation });
  final String bmrResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('BMR CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmrResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    "kcal",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      height: -6.5,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
