import 'package:flutter/material.dart';

const buttonHeight = 60.0;

class CardDesign extends StatelessWidget {
  CardDesign({@required this.colors, this.cardChild, this.pressButton});
  final Widget cardChild;
  final Color colors;
  final Function pressButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressButton,
      child: Container(
        child: cardChild,
        height: 200.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
