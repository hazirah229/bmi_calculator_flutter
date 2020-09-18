import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomBarHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomBarColor = Color(0xFFEB1555);
const weightDefault = 50.0;
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
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.male;
                          //updateColor(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                        info: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                          //updateColor(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                        info: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  ),
                ],
              )
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activeCardColor,
                    info: AnimatedContent(label2: 'HEIGHT', inputText: '150', icon2: Text('test')),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activeCardColor,
                    info: AnimatedContent(label2: 'WEIGHT', inputText: '50', icon2:
                      Row(
                        children: <Widget> [
                          Expanded(
                            child: FlatButton(
                              color: Colors.grey,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(FontAwesomeIcons.minus, size: 22.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {

                                });
                              },
                              //color: Colors.grey,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(FontAwesomeIcons.plus, size: 22.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColor,
                    info: AnimatedContent(label2: 'AGE', inputText: '20', icon2: Text('test')),
                  ),
                ),
              ],
            )
          ),
          Container(
            color: bottomBarColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomBarHeight,
            child: FlatButton (
              textColor: Colors.white,
              child: Text('CALCULATE',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: (){},
            ),
          ),
      ],
      ),
    );
  }
}

class AnimatedContent extends StatelessWidget {
  AnimatedContent({this.label2, this.inputText, this.icon2});

  final String label2;
  final String inputText;
  final Widget icon2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label2,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
        Text(inputText,
          style: TextStyle(
            fontSize: 38.0,
            color: Colors.white,
          ),
        ),
        icon2,
      ],
    );
  }
}

class IconContent extends StatelessWidget {

  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {

  ReusableCard({this.colour, this.info});

  final Widget info;
  final Color colour; //final makes this property immutable

  @override
  Widget build(BuildContext context) {
    return Container(
      child: info,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
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