import 'package:bmicalc/components/norm_button.dart';
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
import 'package:bmicalc/screens/bmiPage.dart';
import 'package:bmicalc/screens/bmrPage.dart';

class InputPage1 extends StatefulWidget {
  @override
  _InputPage1State createState() => _InputPage1State();
}

class _InputPage1State extends State<InputPage1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Navigator.push(
                    context ,
                    MaterialPageRoute(builder: (context) => BMIPage()),
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
                Navigator.push(
                  context ,
                  MaterialPageRoute(builder: (context) => BMRPage()),
                );
              },
            ),
          ),
        ],
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        Navigator.push(
                          context ,
                          MaterialPageRoute(builder: (context) => BMIPage()),
                        );
                      },
                      colour: Colors.amber,
                      cardChild: IconContent(icon:FontAwesomeIcons.bahai,label:'BMI',),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        Navigator.push(
                          context ,
                          MaterialPageRoute(builder: (context) => BMRPage()),
                        );
                      },
                      colour: Colors.amber,
                      cardChild: IconContent(icon:FontAwesomeIcons.bacon,label:'BMR',),
                    ),
                  )
                ],
              ),
            )
        ]
      ),
    );
  }
}





