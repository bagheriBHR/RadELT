import 'package:RadELT/screens/login/components/input_element.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginForm extends StatelessWidget {

  final formKey;
  final emailOnSaved;
  final passwordOnSaved;

  LoginForm({@required this.formKey,this.emailOnSaved,this.passwordOnSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputElement(
              onSaved: emailOnSaved,
              hint: "نام کاربری",
              obscure: false,
              icon: Icons.person,
              validator: (String value){
                if(! isEmail(value)){
                  return 'فرکت ایمیل اشتبار است.';
                }
              }
            ),
            InputElement(
                onSaved: passwordOnSaved,
                hint: "رمز عبور",
                obscure: true,
                icon: Icons.lock_outline,
                validator: (String value){
                  if(value.length < 5){
                    return 'طول پسورد باید حداقل 4 کاراکتر باشد.';
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
