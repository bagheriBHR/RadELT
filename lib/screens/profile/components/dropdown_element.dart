import 'package:flutter/material.dart';

class DropDownElement extends StatelessWidget {

  final dropdownValue;
  final hint;
  final items;
  final onChanged;

  const DropDownElement({Key key,@required this.onChanged,@required this.dropdownValue,@required this.hint,@required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: DropdownButton(
        isExpanded: true,
        hint: Text(hint,style:TextStyle(fontWeight: FontWeight.bold)),
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.grey),
        underline: Container(
          height: 2,
          color: Colors.black12,
        ),
        onChanged:onChanged,
        items: items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
