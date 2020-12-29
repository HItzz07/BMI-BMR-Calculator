

import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/input_page_1.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
//          primaryColor: Color(0xFF0A0E10),
        primaryColor: Color(0xFF0A0E10),
         // scaffoldBackgroundColor: Color(0xFF0A0E10),
        scaffoldBackgroundColor: Color(0xFF17202A),

      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}