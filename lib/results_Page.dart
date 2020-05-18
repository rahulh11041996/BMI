import 'package:bmicalculator/home_page.dart';
import 'package:flutter/material.dart';
import 'card_design.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.status, @required this.result, @required this.descr});
  final String status;
  final String result;
  final String descr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: (Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 0, 0),
              child: Container(
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardDesign(
              colors: cardDisableColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF24D876),
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 80.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    descr,
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEB1555),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 60.0,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
