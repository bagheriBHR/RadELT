import 'package:RadELT/constants.dart';
import 'package:RadELT/screens/login/components/input_element.dart';
import 'package:RadELT/screens/login/components/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';

class RegisterForm extends StatefulWidget {
  final formKey;
  final emailOnSaved;
  final passwordOnSaved;

  RegisterForm({@required this.formKey,this.emailOnSaved,this.passwordOnSaved});

  @override
  _RegiterFormState createState() => _RegiterFormState();
}

class _RegiterFormState extends State<RegisterForm> {

  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  int _number;


  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = await MobileNumber.mobileNumber;
      _simCard = await MobileNumber.getSimCards;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  Widget RadioButtons() {
    List<Widget> widgets = _simCard.asMap().entries
        .map((MapEntry e) =>
        ListTile(
          contentPadding: EdgeInsets.only(right: 7),
          // title: Text(e.value.displayName),
          title: Align(alignment:Alignment.centerRight,child: Directionality(textDirection:TextDirection.ltr,child: Text(e.value.number))),
          leading: Radio(
            activeColor: kPrimaryColor,
            value: e.key,
            groupValue: _number,
            onChanged: ( value) {
              setState(() {
                _number = value;
              });
            },
          ),
        )).toList();
    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            InputElement(
                onSaved: widget.emailOnSaved,
                hint: "نام و نام خانوادگی",
                obscure: false,
                icon: Icons.person,
                validator: (String value){
                  if(! isEmail(value)){
                    return 'فرکت ایمیل اشتبار است.';
                  }
                }
            ),
            InputElement(
                onSaved: widget.emailOnSaved,
                hint: "ایمیل",
                obscure: false,
                icon: Icons.mail,
                validator: (String value){
                  if(! isEmail(value)){
                    return 'فرکت ایمیل اشتبار است.';
                  }
                }
            ),
            InputElement(
                onSaved: widget.passwordOnSaved,
                hint: "رمز عبور",
                obscure: true,
                icon: Icons.lock_outline,
                validator: (String value){
                  if(value.length < 5){
                    return 'طول پسورد باید حداقل 4 کاراکتر باشد.';
                  }
                }
            ),

            Center(
              child: Column(
                children: <Widget>[
                  RadioButtons(),
                  RadioButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

