import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/single/single_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PadCastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length ,
        itemBuilder: (BuildContext context , int index){
          Destination destination  = destinations[index];
          return Container(
            width: 110,
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: destination.imageUrl,
                  child: Material(
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(_)=> SingleArticle(destination:destination)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    offset: Offset(0,2),
                                    color: Colors.black26
                                )
                              ]
                          ),
                          child :ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              height: 120,
                              image: AssetImage(destination.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 2,),
                Text(' انکتاب پیشرفته آموزش زبان',
                  style: TextStyle(fontSize: 10,color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
