import 'package:flutter/material.dart';
import 'card_design.dart';
import 'icon_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_Page.dart';
import 'calculatorMan.dart';

const cardActiveColor = Color(0xFF1D1E33);
const cardDisableColor = Color(0xFF121327);
enum genderClass {
  Male,
  Female,
}

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  genderClass gender;
  int height = 120;
  int weight = 55;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: CardDesign(
                  colors: gender == genderClass.Male
                      ? cardActiveColor
                      : cardDisableColor,
                  cardChild: IconWidget(FontAwesomeIcons.mars, 'MALE'),
                  pressButton: () {
                    setState(() {
                      gender = genderClass.Male;
                    });
                  },
                ),
              ),
              Expanded(
                child: CardDesign(
                  colors: gender == genderClass.Female
                      ? cardActiveColor
                      : cardDisableColor,
                  cardChild: IconWidget(FontAwesomeIcons.venus, 'FEMALE'),
                  pressButton: () {
                    setState(() {
                      gender = genderClass.Female;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CardDesign(
            colors: cardActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF4C4F5E),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      'CM',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF4C4F5E),
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    disabledActiveTrackColor: Color(0x29CACACA),
                    activeTrackColor: Color(0xFFFFFFFF),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 10,
                    max: 230,
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
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
                child: CardDesign(
                  colors: cardActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF4C4F5E),
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          JkrButton(
                            icon: FontAwesomeIcons.minus,
                            jkPress: () {
                              setState(() {
                                if (weight > 10 && weight < 131) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          JkrButton(
                            icon: FontAwesomeIcons.plus,
                            jkPress: () {
                              setState(() {
                                if (weight > 9 && weight < 130) {
                                  weight++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CardDesign(
                  colors: cardActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF4C4F5E),
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          JkrButton(
                            icon: FontAwesomeIcons.minus,
                            jkPress: () {
                              setState(() {
                                if (age > 1 && age < 101) {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          JkrButton(
                            icon: FontAwesomeIcons.plus,
                            jkPress: () {
                              setState(() {
                                if (age > 0 && age < 100) {
                                  age++;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            BmiCalculatorBrain brain =
                BmiCalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  status: brain.statusString(),
                  result: brain.calculator(),
                  descr: brain.fetchValue(),
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEB1555),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: buttonHeight,
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class JkrButton extends StatelessWidget {
  JkrButton({this.icon, this.jkPress});
  final IconData icon;
  final Function jkPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: jkPress,
      fillColor: Color(0xFF4C4F5E),
      elevation: 8.0,
      constraints: BoxConstraints.tightFor(
        width: 44.0,
        height: 44.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
