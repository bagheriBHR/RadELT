import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/category/components/activity-list.dart';
import 'package:RadELT/screens/single/components/top-image.dart';
import 'package:flutter/material.dart';


class SubCategory extends StatefulWidget {

  final Destination destination;
  SubCategory({@required this.destination});

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body:Column(
            children: [
              TopImage(size: size, destination: widget.destination),
              ActivityList(destination:widget.destination),
            ],
          )
      ),
    );
  }
}


