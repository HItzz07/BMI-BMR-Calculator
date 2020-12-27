import 'dart:math';

enum Gender{male , female}
class BMRCalculatorBrain{

  BMRCalculatorBrain({this.height,this.weight ,this.age, this.activityStatus , this.gender});
  final int height;
  final int weight;
  final int age;
  final double activityStatus;
  final int gender;
  double _bmr;
  String calculateBMI(){
    if(gender == 1){
      _bmr = 10*weight + 6.25*height - 5*age + 5;
    }
    else{
      _bmr = 10*weight + 6.25*height - 5*age - 161;
    }
    _bmr = _bmr*activityStatus;
    print(_bmr);
//    print(activityStatus);
    return _bmr.toStringAsFixed(1);
  }

  String getResult(){
    return "You Need To Consume";
  }
  String getInterpretation(){
    return "or Less";
  }
}


//Step 1 – Calculating the Harris–Benedict BMR
//Men	BMR = (10 × weight in kg) + (6.25 × height in cm) - (5 × age in years) + 5
//Women	BMR = (10 × weight in kg) + (6.25 × height in cm) - (5 × age in years) - 161