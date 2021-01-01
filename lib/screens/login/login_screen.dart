import 'package:RadELT/constants.dart';
import 'package:RadELT/screens/login/components/build_logo.dart';
import 'package:RadELT/screens/login/components/custom_button.dart';
import 'package:RadELT/screens/login/components/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  _emailOnSaved(String value){
    _email = value;
  }
  _passwordOnSaved(String value){
    _password = value;
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("فراموشی رمز عبور",style: TextStyle(fontFamily: 'Vazir'),),
        ),
      ],
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.5,
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
                    // Text(
                    //   "ورود",
                    //   style: TextStyle(
                    //     fontSize: MediaQuery.of(context).size.height / 30,
                    //   ),
                    // ),
                  ],
                ),
                LoginForm(
                  formKey: _formKey,
                  emailOnSaved: _emailOnSaved,
                  passwordOnSaved: _passwordOnSaved,
                ),
                SizedBox(height:8),
                _buildForgetPasswordButton(),
                CustomButton(text:'ورود'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () {Navigator.pushReplacementNamed(context, '/register');},
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: ' به ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'RadELT',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' بپیوند ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
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
                _buildSignUpBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
