import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'bmiResult.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmicalc/bmi_brain.dart';
import 'package:bmicalc/screens/bmrPage.dart';

enum Gender{male,female}
class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final  snackBar0 = SnackBar(
    content: Text(
      'Please Select Your Gender',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    backgroundColor: Colors.white60,
    elevation: 40,
    duration: Duration(milliseconds: 1100),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
  );
  Gender selectedGender;
  int height =180;
  int weight = 60;
  int age = 20;

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
      body:ListView(
        children: [
          SizedBox(
            height: hght,
            width: 200,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        //Here we have extracted our flutter widget by doing into flutter outline tab,
                        // so that we can use the same code again when we need as it provides us all the code needed
                        child: ReusableCard(
                          onPress: (){
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          //This has a benefit as initially the selectedGender is set to null
                          // so both card start with inactiveCard color ,as both statement get false
                          colour: selectedGender == Gender.male?kActiveCardColor:kInactiveCardColor,
                          //Here the value equals to male or female card color
                          cardChild: IconContent(icon:FontAwesomeIcons.mars,label:'MALE',),
                        ),
                      ),
                      Expanded(
                        child:ReusableCard(
                          onPress: (){
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female?kActiveCardColor:kInactiveCardColor,
                          cardChild: IconContent(icon:FontAwesomeIcons.venus,label:'FEMALE',),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT',style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5.0,
                            activeTrackColor: Color(0xFFEB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor:   Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),

                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ] ,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),

                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ] ,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                BottomButton(buttonTitle: 'CALCULATE',
                  onTap:(){
                    if (selectedGender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar0);
                    }
                    else {

                      CalculatorBrain calc = CalculatorBrain(height: height,weight:weight );
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        ),
                      ) ,
                      );
                    }
                  } ,
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}





