import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {

  final int value;
  final int groupValue;
  final onChanged;
  final String title;

  const CustomRadioButton({Key key, this.value, this.title,this.groupValue,this.onChanged}) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Radio(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
        ),
        Text(widget.title),
      ]
    );
  }
}




