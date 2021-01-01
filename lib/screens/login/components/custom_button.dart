import 'package:RadELT/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;

  const CustomButton({Key key,@required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: (){ Navigator.pushReplacementNamed(context, '/home');},
          child: Container(
            alignment: Alignment.center,
            height: 1.4 * (MediaQuery.of(context).size.height / 20),
            width: 5 * (MediaQuery.of(context).size.width / 8),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color:kThirdColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6
                ),
              ],
            ),
            child:Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ),
      ],
    );
  }
}
