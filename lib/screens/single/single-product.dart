import 'package:RadELT/models/destination_model.dart';
import 'file:///E:/mr_pourzare/flutter/first_app/lib/screens/category/components/activity-list.dart';
import 'package:RadELT/screens/single/components/top-image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {

  final Destination destination;
  SingleProduct({@required this.destination});

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

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


