import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmicalc/calculator_brain.dart';
import 'package:bmicalc/screens/bmrPage.dart';

enum Gender{male,female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height =180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
//        title: Center(child: Text('Home Page')),
          actions: <Widget>[
            Expanded(
              child:ReusableCard(
                colour: Colors.pink,
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
                colour: Colors.blueGrey,
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
            CalculatorBrain calc = CalculatorBrain(height: height,weight:weight );
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
              ),
              ) ,
              );
            } ,
          ),
        ],
      ),
    );
  }
}





