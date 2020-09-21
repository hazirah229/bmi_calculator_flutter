import 'package:bmi_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_flutter/constants.dart';
class ResultPage extends StatelessWidget {

  ResultPage({@required this.interpretation,
    @required this.bmiResult,
    @required this.resultText});

  final String interpretation;
  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                  'Your Result',
                  style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          Container(
            color: kbottomBarColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kbottomBarHeight,
            child: FlatButton (
              textColor: Colors.white,
              child: Text(
                'RE-CALCULATE',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: (){
                Navigator.pop(context);
                // print(weight/pow(height/100, 2));
              },
            ),
          ),
        ],
      ),
    );
  }
}
