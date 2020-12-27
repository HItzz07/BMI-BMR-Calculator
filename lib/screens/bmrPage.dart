import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmicalc/bmr_Brain.dart';
import 'bmrResult.dart';
import 'package:bmicalc/screens/input_page.dart';

enum Gender{male,female}
class BMRPage extends StatefulWidget {
  @override
  _BMRPageState createState() => _BMRPageState();
}
GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
class _BMRPageState extends State<BMRPage> {

  final snackBar = SnackBar(content: Text('Please Select Your Activity Status and Gender'));
  Gender selectedGender;
  String dropDownValue ;
  int genBool = 1;
  final String disabledHintData = 'Choose Your activity Status';
  int height =180;
  int weight = 60;
  int age = 20;
  Map<String , double> map = {" Little or No Exercise":1.2,
                              " 1 - 3 days in week":1.375,
                              " 3 - 5 days in week":1.55,
                              " 6 - 7 days in  week":1.725,
                              " Super Active":1.9,};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
//        title: Center(child: Text('Home Page')),
          brightness: Brightness.dark,
          elevation: 40,
          actions: <Widget>[
            Expanded(
              child:ReusableCard(
                colour: Colors.blueGrey,
                cardChild: Text(
                  '           BMI ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPress: (){
                  Navigator.pushReplacement(
                    context ,
                    MaterialPageRoute(builder: (context) => InputPage()),
                  );
                },
              ),
            ),
            Expanded(
              child:ReusableCard(
                colour: Colors.pink,
                cardChild: Text(
                  '            BMR ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPress: (){
                  Navigator.pushReplacement(
                    context ,
                    MaterialPageRoute(builder: (context) => BMRPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//          Expanded(
            Row(
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
//          ),
            Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
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
                                  width: 10.0,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                SizedBox(
                                  width: 10.0,
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
                                  width: 10.0,
                                ),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
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
//              Expanded(
//              child: ReusableCard(
                ReusableCard(
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
//              ),
            ],
          ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                    cardChild: DropdownButton<String>(
                      value: dropDownValue,
                      hint: Text(' Select Your Choice          '),
//                  disabledHint:disabledHintData,
                      focusColor: Colors.green,
                      iconEnabledColor: Colors.greenAccent,
                      icon: Icon(Icons.arrow_drop_up),
                      iconSize: 70,
                      elevation: 20,
                      style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),
                      underline: Container(
                        height: 2,
                        color: Colors.pink,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropDownValue = newValue;
                        });
                      },
                      items: <String>[" Little or No Exercise", " 1 - 3 days in week", " 3 - 5 days in week", " 6 - 7 days in  week" , " Super Active"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    colour: Colors.grey,
                  ),

                ),

              ],
            ),
          BottomButton(buttonTitle: 'CALCULATE',
            onTap:(){
              if(selectedGender == Gender.male) genBool = 1;
              else genBool = 0;
              if(dropDownValue == null || selectedGender == null) {
                _globalKey.currentState.showSnackBar(snackBar);
              }
              else{
                BMRCalculatorBrain calc = BMRCalculatorBrain(height: height,weight:weight ,age: age, gender: genBool, activityStatus: map[dropDownValue],);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>BMRResultsPage(
                    bmrResult: calc.calculateBMI(),
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
    );
  }
}





