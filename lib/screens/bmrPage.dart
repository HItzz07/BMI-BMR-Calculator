import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'bmiResult.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmicalc/bmr_Brain.dart';
import 'bmrResult.dart';
import 'package:bmicalc/screens/bmiPage.dart';

enum Gender { male, female }
class BMRPage extends StatefulWidget {
  @override
  _BMRPageState createState() => _BMRPageState();
}

GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

class _BMRPageState extends State<BMRPage> {
  final  snackBar1 = SnackBar(
    content: Text(
      'Please Select Your Gender',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    backgroundColor: Colors.white60,
    elevation: 40,
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: 1100),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
  );
  final  snackBar2 = SnackBar(
    content: Text(
      'Please Select Your Activity Status ',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    duration: Duration(milliseconds: 1100),
    backgroundColor: Colors.white60,
    elevation: 40,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
  );
  final String disabledHintData = 'Choose Your activity Status';
  Gender selectedGender;
  String dropDownValue;
  int genBool = 1;

  int height = 180;
  int weight = 60;
  int age = 20;
  Map<String, double> map = {
    " Little or No Exercise": 1.2,
    " 1 - 3 days in week": 1.375,
    " 3 - 5 days in week": 1.55,
    " 6 - 7 days in  week": 1.725,
    " Super Active": 1.9,
  };

  @override
  Widget build(BuildContext context) {
    double ht = 710;
    double wdth = MediaQuery.of(context).size.width;
    double hght = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    hght = hght - padding.top - padding.bottom - 60;
    ht = hght - wdth;
    if (ht < 0) ht = -1 * ht;
    if (ht < 200)
      hght = 2 * wdth;
    else if (hght < wdth) hght = wdth;
    print('$wdth and $hght');
    return Scaffold(
      key: _globalKey,
      body: ListView(
        children: [
          SizedBox(
            height: hght,
            width: 200,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          //Here the value equals to male or female card color
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: 'FEMALE',
                          ),
                        ),
                      ),
                    ],
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Column(
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
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          RoundIconButton(
                                            icon: FontAwesomeIcons.minus,
                                            onPressed: () {
                                              setState(() {
                                                weight--;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          RoundIconButton(
                                            icon: FontAwesomeIcons.plus,
                                            onPressed: () {
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
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
                                      children: [
                                        RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              age--;
                                            });
                                          },
                                        ),
                                        // SizedBox(
                                        //   width: 10.0,
                                        // ),

                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              age++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'HEIGHT',
                                style: kLabelTextStyle,
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
                                  thumbColor: Color(0xFFEB1555),
                                  overlayColor: Color(0x29EB1555),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 12.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 25.0),
                                ),
                                child: Slider(
                                  value: height.toDouble(),
                                  min: 120.0,
                                  max: 220.0,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue.round();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  flex: 4,
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          cardChild: DropdownButton<String>(
                            value: dropDownValue,
                            hint: Text(' Select Your Choice'),
//                  disabledHint:disabledHintData,
                            focusColor: Colors.green,
                            iconEnabledColor: Colors.greenAccent,
                            icon: Icon(Icons.arrow_drop_up),
                            iconSize: 70,
                            elevation: 20,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Colors.pink,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropDownValue = newValue;
                              });
                            },
                            items: <String>[
                              " Little or No Exercise",
                              " 1 - 3 days in week",
                              " 3 - 5 days in week",
                              " 6 - 7 days in  week",
                              " Super Active"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          colour: Color(0xFF444544),
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                BottomButton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    if (selectedGender == Gender.male)
                      genBool = 1;
                    else
                      genBool = 0;
                    if (selectedGender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                    }
                    else if(dropDownValue == null ){
                      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                    }
                    else {
                      BMRCalculatorBrain calc = BMRCalculatorBrain(
                        height: height,
                        weight: weight,
                        age: age,
                        gender: genBool,
                        activityStatus: map[dropDownValue],
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMRResultsPage(
                            bmrResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          //  GestureDetector(
          //  child:
          //  onPanUpdate: (details) {
          //    if (details.delta.dx > 15) {
          //    Navigator.pushReplacement(
          //    context ,
          //    MaterialPageRoute(builder: (context) => InputPage()),
          //    );
          //    }
          //    }
          // ),
        ],
      ),
    );
  }
}
