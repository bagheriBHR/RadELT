import 'package:flutter/material.dart';

class BuildLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130,
          child: Image.asset('assets/images/Logo Square.png'),
        ),
      ],
    );
  }
}
