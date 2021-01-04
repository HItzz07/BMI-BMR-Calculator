import 'package:bmicalc/constants.dart';
import 'package:bmicalc/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

    ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation });
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    double ht = 710;
    double wdth = MediaQuery.of(context).size.width;
    double hght = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    hght = hght - padding.top - padding.bottom-60;
    ht = hght - wdth;
    if(ht < 0 ) ht = -1*ht;
    if(ht < 200 ) hght = 2*wdth;
    else if(hght < wdth) hght = wdth;
    return Scaffold(
      appBar:AppBar(
      ),
      body:GestureDetector(
        onPanUpdate: (details){
          if(details.delta.dx > 15) Navigator.pop(context);
        },
        child: ListView(
          children: [
            SizedBox(
              height: hght,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Your Result',
                      style: kTitleTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              resultText.toUpperCase(),
                              style: kResultTextStyle,
                            ),
                          ),
                          Center(
                            child: Text(
                              bmiResult,
                              style: kBMITextStyle,
                            ),
                          ),
                          Text(
                            interpretation,
                            style: kBodyTextStyle,
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
            ),
          ],
        ),
      ),
      );
  }
}
