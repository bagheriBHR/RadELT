
import 'package:RadELT/constants.dart';
import 'package:RadELT/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopImage extends StatelessWidget {
  const TopImage({
    Key key,
    @required this.size,
    @required this.destination,
  }) : super(key: key);

  final Size size;
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ],
              borderRadius: BorderRadius.circular(30)
          ),
          child: Hero(
            tag: destination.imageUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.zero,bottom: Radius.circular(30)),
              child: Image(
                image: AssetImage(destination.imageUrl),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: kDefaultPadding/2,
            right: kDefaultPadding/2,
            top: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: ()=> Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                iconSize: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}