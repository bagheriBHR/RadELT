import 'package:RadELT/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopServices extends StatefulWidget {
  @override
  _TopServicesState createState() => _TopServicesState();
}

class _TopServicesState extends State<TopServices> {

  int _currentSelectedService = 0;

  List <IconData> _icons = [
    FontAwesomeIcons.chalkboardTeacher,
    FontAwesomeIcons.solidNewspaper,
    FontAwesomeIcons.film,
    Icons.volume_up,
    FontAwesomeIcons.book,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding/2,
        right: kDefaultPadding/2,
        bottom: kDefaultPadding *1.5,
        top: kDefaultPadding *1.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _icons
            .asMap()
            .entries
            .map((MapEntry e) => _serviceItem(e.key)
        ).toList(),
      ),
    );
  }

  Widget _serviceItem(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _currentSelectedService = index;
        });
      },
      child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: _currentSelectedService == index
                  ?kPrimaryColor
                  :Color(0xFFE7EBEE),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,5),
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 10
                )
              ],
              shape: BoxShape.circle
            ),
            child: Icon(_icons[index],
              color:  _currentSelectedService == index
                ?kThirdColor
                :Colors.black.withOpacity(0.3),
              size:23,
            ),
          ),
    );
  }
}
