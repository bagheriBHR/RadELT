import 'package:RadELT/constants.dart';
import 'package:RadELT/screens/login/components/build_logo.dart';
import 'package:RadELT/screens/login/components/custom_button.dart';
import 'package:RadELT/screens/login/components/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  _emailOnSaved(String value){
    _email = value;
  }
  _passwordOnSaved(String value){
    _password = value;
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "عضویت",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                RegisterForm(
                  formKey: _formKey,
                  emailOnSaved: _emailOnSaved,
                  passwordOnSaved: _passwordOnSaved,
                ),

                CustomButton(text:'ثبت'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BuildLogo(),
                _buildContainer(),
                SizedBox(height: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
