

import 'package:RadELT/constants.dart';
import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/category/articles_list_all.dart';
import 'package:RadELT/screens/category/category.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key key,
    @required this.title,
    @required this.type,
  }) : super(key: key);

  final title;
  final type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.black87),),
          GestureDetector(
            onTap: (){},
            child: GestureDetector(
                child: Text('مشاهده همه',style: TextStyle(color: Colors.indigo,fontSize: 14),),
              onTap: (){
                  if(type=='course'){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryList()));
                  }
                  if(type=='article'){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>AllArticles()));
                  }
              }
            ),
          )
        ],
      ),
    );
  }
}