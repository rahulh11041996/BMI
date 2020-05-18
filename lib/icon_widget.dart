import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData GenderIcon;
  final String label;
  IconWidget(this.GenderIcon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          GenderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF4C4F5E),
          ),
        )
      ],
    );
  }
}
