import 'package:RadELT/constants.dart';
import 'package:flutter/material.dart';

class InputElement extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;
  final onSaved;
  final validator;

  const InputElement({Key key,@required this.hint,@required this.obscure,@required this.icon,@required this.onSaved,@required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        onSaved: onSaved,
        obscureText: obscure,
        validator: validator,
        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Vazir',color: Colors.grey),
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            labelText: hint),
      ),
    );
  }
}
