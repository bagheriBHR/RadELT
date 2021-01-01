import 'package:RadELT/screens/login/components/input_element.dart';
import 'package:RadELT/screens/login/components/radio_button.dart';
import 'package:RadELT/screens/profile/components/dropdown_element.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override

  final _formKey = GlobalKey<FormState>();

  int _groupValue;
  String _StateValue;
  String _cityValue;
  String _email;
  String _name;
  String _password;

  final TextEditingController textEditingController = TextEditingController();

  PersianDatePickerWidget persianDatePicker;

  @override
  void initState() {

    /*Simple DatePicker*/
    persianDatePicker = PersianDatePicker(
      controller: textEditingController,
    ).init();

    super.initState();
  }

  _emailOnSaved(String value){
    _email = value;
  }
  _nameOnSaved(String value){
    _name = value;
  }
  _passwordOnSaved(String value){
    _password = value;
  }

  _onchanged(value){
    setState(() {
      _groupValue = value;

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ویرایش پروفایل'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width:MediaQuery.of(context).size.width*0.8,
            child:Form(
              key: _formKey,
              child: Column(
              children: [
                InputElement(
                    onSaved: _nameOnSaved,
                    hint: "نام ونام خانوادگی",
                    obscure: false,
                    icon: Icons.person,
                    validator: (String value){
                      if(! isEmail(value)){
                        return 'فرکت ایمیل اشتبار است.';
                      }
                    }
                ),
                InputElement(
                    onSaved: _emailOnSaved,
                    hint: "ایمیل",
                    obscure: false,
                    icon: Icons.mail_outline,
                    validator: (String value){
                      if(! isEmail(value)){
                        return 'فرکت ایمیل اشتبار است.';
                      }
                    }
                ),
                InputElement(
                    onSaved: _passwordOnSaved,
                    hint: "رمز عبور",
                    obscure: true,
                    icon: Icons.lock_outline,
                    validator: (String value){
                      if(value.length < 5){
                        return 'طول پسورد باید حداقل 4 کاراکتر باشد.';
                      }
                    }
                ),
                DatePickerElement(persianDatePicker: persianDatePicker, textEditingController: textEditingController),
                Gender(),
                DropDownElement(
                  dropdownValue: _StateValue,
                  hint:'انتخاب استان',
                    items:<String>[ 'شیراز', 'اصفهان', 'کرمان'],
                  onChanged:(val){
                    setState(() {
                      _StateValue = val;
                    });
                  }
                ),
                DropDownElement(
                  dropdownValue:_cityValue,
                  hint:'انتخاب شهر',
                  items:<String>['جیرفت', 'شهربابک', 'رفسنجان'],
                  onChanged:(val){
                    setState(() {
                      _cityValue = val;
                    });
                  }
                ),
                SizedBox(height:8),
                SaveButton()
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }

  Padding Gender() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('جنسیت : ',style: TextStyle(fontWeight: FontWeight.bold),),
          CustomRadioButton(title: 'زن',value: 0,groupValue: _groupValue,onChanged: _onchanged),
          CustomRadioButton(title: 'مرد',value: 1,groupValue: _groupValue,onChanged: _onchanged,)
        ],
      ),
    );
  }

  Row SaveButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          child: Text('ثبت'),
          onPressed: (){
            _formKey.currentState.reset();
          },
        )
      ],
    );
  }
}

class DatePickerElement extends StatelessWidget {
  const DatePickerElement({
    Key key,
    @required this.persianDatePicker,
    @required this.textEditingController,
  }) : super(key: key);

  final PersianDatePickerWidget persianDatePicker;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.date_range,
              color: Colors.grey,
            ),
            labelText: 'تاریخ تولد'),
        enableInteractiveSelection: false, // *** this is important to prevent user interactive selection ***
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode()); // to prevent opening default keyboard
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return persianDatePicker;
              });
        },
        controller: textEditingController,
      ),
    );
  }
}
