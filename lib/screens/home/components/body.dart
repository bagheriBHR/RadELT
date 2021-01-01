import 'package:RadELT/screens/home/components/article_list.dart';
import 'package:RadELT/screens/home/components/book_list.dart';
import 'package:RadELT/screens/home/components/padcast_list.dart';
import 'package:RadELT/screens/home/components/product-list.dart';
import 'package:RadELT/screens/home/components/title.dart';
import 'package:RadELT/screens/home/components/top-services.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopServices(),

            CustomTitle(title:'آخرین دوره ها',type:'course'),
            ProductList(),

            SizedBox(height: 10,),
            CustomTitle(title:'داغ ترین مقالات',type:'article'),
            ArticleList(),

            // SizedBox(height: 10,),
            // CustomTitle(title:'آخرین پادکست ها',type:'padcast'),
            // PadCastList(),

            // SizedBox(height: 10,),
            // CustomTitle(title:'آخرین کتاب ها',type:'book'),
            // BookList(),
          ],
        ),
      ),
    );
  }
}





