import 'package:bmi_flutter/calculator_brain.dart';
import 'package:bmi_flutter/constants.dart';
import 'package:bmi_flutter/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_flutter/reusable_card.dart';
import 'package:bmi_flutter/round_icon_btn.dart';
import 'package:bmi_flutter/icon_content.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('BMI CALCULATOR')
        ),
      ),
      // margin: EdgeInsets.all(15.0),
      // decoration: BoxDecoration(
      //   color: Color(0xFF1D1E33),
      //   borderRadius: BorderRadius.circular(10.0),
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                          //updateColor(Gender.male);
                        });
                      },
                      colour: selectedGender == Gender.male ? kactiveCardColor : kinactiveCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE',
                      ),
                      ),
                    ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                          //updateColor(Gender.female);
                        });
                      },
                      colour: selectedGender == Gender.female ? kactiveCardColor : kinactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                ],
              )
            ),
          Expanded(
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: klabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: klabelNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          //reset text based on slider accordingly
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
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: klabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
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
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: klabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
            color: kbottomBarColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kbottomBarHeight,
            child: FlatButton (
              textColor: Colors.white,
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),),
                );
                // print(weight/pow(height/100, 2));
              },
            ),
          ),
      ],
      ),
    );
  }
}



// Color maleCardCol = inactiveCardColor;
// Color femaleCardCol = inactiveCardColor;
//
// void updateColor(Gender selectedGender) {
//   if (selectedGender == Gender.male) {
//     if(maleCardCol == inactiveCardColor) {
//       maleCardCol = activeCardColor;
//       femaleCardCol = inactiveCardColor;
//     } else
//       maleCardCol = inactiveCardColor;
//   } else if (selectedGender == Gender.female) {
//     if(femaleCardCol == inactiveCardColor) {
//       femaleCardCol = activeCardColor;
//       maleCardCol = inactiveCardColor;
//     } else
//       femaleCardCol = inactiveCardColor;
//   }
// }